-- CustomUIColors.lua
local mod = get_mod("CustomUIColors")

-- Реестр всех виджетов по меню
local WIDGET_REGISTRY = {}
local MENU_MODULES = {
	"Views/CUIC_MainMenuView",
	-- "Views/CUIC_CraftingView",
	-- "Views/CUIC_TalentBuilderView",
	-- "Views/CUIC_InventoryView",
}

-- Функция безопасной загрузки модуля
local function safe_load_module(module_path)
	local success, module = pcall(function()
		return mod:io_dofile("CustomUIColors/" .. module_path)
	end)
	
	if success and module then
		return module
	else
		mod:error("Failed to load module: %s, error: %s", module_path, tostring(module))
		return nil
	end
end

-- Функция загрузки всех модулей
local function load_all_modules()
	WIDGET_REGISTRY = {}
	
	for _, module_path in ipairs(MENU_MODULES) do
		local module = safe_load_module(module_path)
		if module then
			-- Используем имя из модуля напрямую
			local menu_name = module.menu_name
			if menu_name then
				WIDGET_REGISTRY[menu_name] = module
				mod:info("Loaded module: %s -> %s", module_path, menu_name)
			else
				mod:error("Module %s has no menu_name field", module_path)
			end
		end
	end
	
	mod:info("Total loaded modules: %d", table.size(WIDGET_REGISTRY))
	return WIDGET_REGISTRY
end

-- Инициализация при загрузке мода
local function initialize_mod()
	load_all_modules()

	-- Проверяем, что основные модули загружены
	if not WIDGET_REGISTRY["main_menu"] then
		mod:error("Main menu module failed to load!")
	end

	-- if not WIDGET_REGISTRY["crafting"] then
		-- mod:warning("Crafting module not loaded (optional)")
	-- end
end

-- Вызываем инициализацию
initialize_mod()

-- Текущие активные виджеты и меню
local ACTIVE_WIDGETS = {}
local CURRENT_MENU = nil

-- Флаг изменений
mod._color_changed =		false
mod._alpha_changed =		false
mod._hooks_created =		false
mod._crafting_hooked =		false
mod._need_crafting_hook =	false

-- Функция для загрузки виджетов меню
local function load_menu_widgets(menu_name)
	local menu_module = WIDGET_REGISTRY[menu_name]
	if not menu_module then
		mod:warning("No widgets defined for menu: " .. menu_name)
		ACTIVE_WIDGETS = {}
		CURRENT_MENU = nil
		return
	end
	
	ACTIVE_WIDGETS = menu_module.WIDGETS or {}
	CURRENT_MENU = menu_name
	
	mod:info("Loaded %d widgets for %s", table.size(ACTIVE_WIDGETS), menu_name)
end

-- Получение цвета для виджета
local function get_color(widget_name)
	if CURRENT_MENU and ACTIVE_WIDGETS[widget_name] then
		local setting_id = CURRENT_MENU .. "_" .. widget_name .. "_color"
		local color = mod:get(setting_id)
		if color and color ~= "" then
			return color
		end
		
		-- Возвращаем дефолтный цвет из виджета
		return ACTIVE_WIDGETS[widget_name].default_color or "terminal_grid_background"
	end
	
	return "terminal_grid_background"
end

-- Получение альфа-канала для виджета
local function get_alpha(widget_name)
	if CURRENT_MENU and ACTIVE_WIDGETS[widget_name] and ACTIVE_WIDGETS[widget_name].supports_alpha then
		local setting_id = CURRENT_MENU .. "_" .. widget_name .. "_alpha"
		local alpha = mod:get(setting_id)
		
		if alpha ~= nil then
			-- DMF уже возвращает значение 0-255, не нужно нормализовать
			return math.max(0, math.min(255, math.floor(alpha)))
		end
		
		-- Возвращаем дефолтный альфа
		return ACTIVE_WIDGETS[widget_name].default_alpha or 255
	end
	
	return 255
end

-- Создание цвета с альфа-каналом
local function create_color_with_alpha(color_name, alpha)
	local color_func = Color[color_name]
	if not color_func then 
		mod:error("Color '%s' not found", color_name)
		return Color.terminal_grid_background(alpha, true)
	end
	
	return color_func(alpha, true)
end

-- Применение цвета к виджету
local function apply_color(widget, widget_name)
	mod:debug("=== APPLY_COLOR called for: %s ===", widget_name)
	
	if not widget then 
		mod:error("Widget %s is nil!", widget_name)
		return 
	end
	
	if not widget.style then 
		mod:error("Widget %s has no style!", widget_name)
		return 
	end
	
	local widget_data = ACTIVE_WIDGETS[widget_name]
	if not widget_data then
		mod:debug("Widget data not found: %s", widget_name)
		return
	end
	
	local color_name = get_color(widget_name)
	local alpha_value = get_alpha(widget_name)
	
	mod:debug("Applying to %s: color=%s, alpha=%d", widget_name, color_name, alpha_value)
	
	-- Создаем цвет с учетом прозрачности
	local new_color = create_color_with_alpha(color_name, alpha_value)
	if not new_color then 
		mod:error("Failed to create color for %s", widget_name)
		return 
	end
	
	-- Применяем цвет к указанным стилям
	if widget_data.style_ids then
		for _, style_path in ipairs(widget_data.style_ids) do
			local parts = string.split(style_path, ".")
			local style = widget.style
			
			for i = 1, #parts - 1 do
				style = style[parts[i]]
				if not style then 
					mod:debug("Style part not found: %s", parts[i])
					break 
				end
			end
			
			if style and style[parts[#parts]] then
				style[parts[#parts]] = new_color
				mod:info("✓ Applied color to %s.%s", widget_name, style_path)
			else
				mod:debug("Style property not found: %s", style_path)
			end
		end
	end
end

-- Обновление всех виджетов
local function update_all(widgets)
	if not widgets then 
		mod:warning("No widgets provided to update_all")
		return 
	end
	
	mod:debug("update_all called with %d widgets", table.size(widgets))
	
	for widget_name, _ in pairs(ACTIVE_WIDGETS) do
		mod:debug("Checking widget: %s", widget_name)
		if widgets[widget_name] then
			apply_color(widgets[widget_name], widget_name)
		else
			mod:debug("Widget %s not found in _widgets_by_name", widget_name)
		end
	end
end

-- Функция для навешивания хуков на MainMenuView
local function hook_main_menu()
	if mod._main_menu_hooked then
		return true
	end
	
	-- Хук для _create_widgets
	local create_success = pcall(function()
		mod:hook_safe("MainMenuView", "_create_widgets", function(self)
			mod:pcall(function()
				mod:info("=== MainMenuView._create_widgets HOOK ===")
				CURRENT_MENU = "main_menu"
				load_menu_widgets("main_menu")
				
				if self._widgets_by_name then
					mod:info("Found %d widgets", table.size(self._widgets_by_name))
					update_all(self._widgets_by_name)
				end
			end)
		end)
	end)
	
	if not create_success then
		mod:warning("Failed to hook MainMenuView._create_widgets")
		return false
	end
	
	-- Хук для update
	local update_success = pcall(function()
		mod:hook_safe("MainMenuView", "update", function(self)
			if (mod._color_changed or mod._alpha_changed) and 
			   CURRENT_MENU == "main_menu" and 
			   self._widgets_by_name then
				mod:pcall(function()
					mod:info("Updating MainMenuView colors")
					update_all(self._widgets_by_name)
					mod._color_changed = false
					mod._alpha_changed = false
				end)
			end
		end)
	end)
	
	if not update_success then
		mod:warning("Failed to hook MainMenuView.update")
		return false
	end
	
	mod._main_menu_hooked = true
	mod:info("✓ Hooks created for MainMenuView")
	return true
end

-- Функция для навешивания хуков на CraftingView
local function hook_crafting_view()
	if mod._crafting_hooked then
		return true
	end
	
	-- Проверяем, существует ли класс CraftingView
	if not rawget(_G, "CraftingView") then
		return false
	end
	
	-- Хук для _create_widgets
	local create_success = pcall(function()
		mod:hook_safe("CraftingView", "_create_widgets", function(self)
			mod:pcall(function()
				mod:info("=== CraftingView._create_widgets HOOK ===")
				CURRENT_MENU = "crafting"
				load_menu_widgets("crafting")
				
				if self._widgets_by_name then
					mod:info("Found %d widgets", table.size(self._widgets_by_name))
					update_all(self._widgets_by_name)
				end
			end)
		end)
	end)
	
	if not create_success then
		mod:warning("Failed to hook CraftingView._create_widgets")
		return false
	end
	
	-- Хук для update
	local update_success = pcall(function()
		mod:hook_safe("CraftingView", "update", function(self)
			if (mod._color_changed or mod._alpha_changed) and 
			   CURRENT_MENU == "crafting" and 
			   self._widgets_by_name then
				mod:pcall(function()
					mod:info("Updating CraftingView colors")
					update_all(self._widgets_by_name)
					mod._color_changed = false
					mod._alpha_changed = false
				end)
			end
		end)
	end)
	
	if not update_success then
		mod:warning("Failed to hook CraftingView.update")
		return false
	end
	
	mod._crafting_hooked = true
	mod._need_crafting_hook = false
	mod:info("✓ Hooks created for CraftingView")
	return true
end

-- Хуки для определения меню через ViewController
local function hook_view_controller()
	local success = pcall(function()
		mod:hook_safe("ViewController", "open_view", function(self, view_name, ...)
			mod:debug("ViewController.open_view called: %s", view_name)
			
			-- Проверяем все модули на соответствие
			for menu_name, module in pairs(WIDGET_REGISTRY) do
				if module.VIEW_NAME == view_name then
					load_menu_widgets(menu_name)
					mod._color_changed = true
					mod:info("Switched to menu: %s -> %s", view_name, menu_name)
					
					-- Если это CraftingView и хуки еще не навешены
					if view_name == "CraftingView" and not mod._crafting_hooked then
						hook_crafting_view()
					end
					break
				end
			end
		end)
	end)
	
	if success then
		mod:info("✓ Hooked ViewController.open_view")
	else
		mod:error("Failed to hook ViewController.open_view")
	end
	
	return success
end

-- Создание всех хуков
local function create_hooks()
	if mod._hooks_created then
		return
	end
	
	-- Хукаем ViewController
	hook_view_controller()
	
	-- Хукаем MainMenuView
	hook_main_menu()
	
	-- Хукаем CraftingView
	if not hook_crafting_view() then
		mod._need_crafting_hook = true
		mod:info("CraftingView not available yet, will try later")
	end
	
	mod._hooks_created = true
	mod:info("All hooks created")
end

-- Функция update для периодической проверки CraftingView
mod.update = function(dt)
	if mod._need_crafting_hook then
		if hook_crafting_view() then
			mod._need_crafting_hook = false
		end
	end
end

-- Обработка изменений настроек
mod.on_setting_changed = function(setting_id)
	-- Проверяем настройки по всем меню
	for menu_name, module in pairs(WIDGET_REGISTRY) do
		if module.WIDGETS then
			for widget_name, widget_data in pairs(module.WIDGETS) do
				-- Настройки цвета
				local color_setting_id = menu_name .. "_" .. widget_name .. "_color"
				if setting_id == color_setting_id then
					mod._color_changed = true
					-- mod:notify(widget_data.description .. " color updated")
					return
				end
				
				-- Настройки прозрачности
				if widget_data.supports_alpha then
					local alpha_setting_id = menu_name .. "_" .. widget_name .. "_alpha"
					if setting_id == alpha_setting_id then
						mod._alpha_changed = true
						-- mod:notify(widget_data.description .. " transparency updated")
						return
					end
				end
			end
		end
	end
	
	-- Кнопки утилиты
	if setting_id == "refresh_now" then
		mod._color_changed =	true
		mod._alpha_changed =	true
		mod:notify("Colors and transparency refreshed")
	elseif setting_id == "reset_all_colors" then
		mod.cb_reset_all_colors()
	elseif setting_id == "reload_modules" then
		mod.cb_reload_modules()
	end
end

-- Инициализация
mod.on_enabled = function()
	-- Создаем хуки
	create_hooks()
	
	mod._color_changed =		true
	mod._alpha_changed =		true
	mod:notify("Custom UI Backgrounds enabled")
end

mod.on_disabled = function()
	mod._color_changed =		nil
	mod._alpha_changed =		nil
	mod._hooks_created =		nil
	mod._main_menu_hooked =		nil
	mod._crafting_hooked =		nil
	mod._need_crafting_hook =	nil
	CURRENT_MENU = nil
	ACTIVE_WIDGETS = {}
	mod:notify("Custom UI Backgrounds disabled")
end

-- Утилитные функции
mod.cb_refresh_now = function()
	mod._color_changed =		true
	mod._alpha_changed =		true
	mod:notify("Colors and transparency refreshed")
end

mod.cb_reload_modules = function()
	mod:info("Reloading all modules...")
	load_all_modules()
	mod._color_changed =		true
	mod._alpha_changed =		true
	mod:notify("Modules reloaded")
end


-- DEBUG
mod.cb_reset_all_colors = function()
	mod:notify("Resetting all colors to default...")

	-- Сбрасываем настройки для всех меню
	for menu_name, module in pairs(WIDGET_REGISTRY) do
		if module.WIDGETS then
			for widget_name, widget_data in pairs(module.WIDGETS) do
				local color_setting_id = menu_name .. "_" .. widget_name .. "_color"
				if widget_data.default_color then
					mod:set(color_setting_id, widget_data.default_color)
				end
				
				if widget_data.supports_alpha and widget_data.default_alpha then
					local alpha_setting_id = menu_name .. "_" .. widget_name .. "_alpha"
					mod:set(alpha_setting_id, widget_data.default_alpha)
				end
			end
		end
	end
	
	mod._color_changed = true
	mod._alpha_changed = true
	mod:notify("All colors have been reset to default")
end

-- Функция для быстрого скрытия элементов (установка прозрачности в 0)
mod.cb_hide_all_elements = function()
	if not CURRENT_MENU or not ACTIVE_WIDGETS then
		mod:echo("No menu loaded")
		return
	end
	
	local changed = 0
	for widget_name, widget_data in pairs(ACTIVE_WIDGETS) do
		if widget_data.supports_alpha then
			local alpha_setting_id = CURRENT_MENU .. "_" .. widget_name .. "_alpha"
			mod:set(alpha_setting_id, 0)
			changed = changed + 1
		end
	end
	
	mod._alpha_changed = true
	mod:notify(string.format("Set %d elements to transparent", changed))
end

-- Функция для быстрого показа элементов (установка прозрачности в 255)
mod.cb_show_all_elements = function()
	if not CURRENT_MENU or not ACTIVE_WIDGETS then
		mod:echo("No menu loaded")
		return
	end
	
	local changed = 0
	for widget_name, widget_data in pairs(ACTIVE_WIDGETS) do
		if widget_data.supports_alpha then
			local alpha_setting_id = CURRENT_MENU .. "_" .. widget_name .. "_alpha"
			mod:set(alpha_setting_id, 255)
			changed = changed + 1
		end
	end
	
	mod._alpha_changed = true
	mod:notify(string.format("Set %d elements to opaque", changed))
end
