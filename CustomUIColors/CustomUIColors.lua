--[[-- Хуки для каждого вида - более прямой подход -- РАБОТАЮТ!!! Хоть и кривовато.
mod:hook_safe("MainMenuView", "_create_widgets", function(self)
	mod:pcall(function()
		-- Устанавливаем текущее меню
		CURRENT_MENU = "main_menu"
		load_menu_widgets("main_menu")
		
		-- Немедленно применяем цвета
		if self._widgets_by_name then
			for widget_name, widget_data in pairs(ACTIVE_WIDGETS) do
				local widget = self._widgets_by_name[widget_name]
				if widget then
					apply_color(widget, widget_name)
				end
			end
		end
	end)
end)

mod:hook_safe("MainMenuView", "update", function(self)
	if (mod._color_changed or mod._alpha_changed) and 
	   CURRENT_MENU == "main_menu" and 
	   self._widgets_by_name then
		mod:pcall(function()
			for widget_name, widget_data in pairs(ACTIVE_WIDGETS) do
				local widget = self._widgets_by_name[widget_name]
				if widget then
					apply_color(widget, widget_name)
				end
			end
			mod._color_changed = false
			mod._alpha_changed = false
		end)
	end
end)

mod:hook_safe("CraftingView", "_create_widgets", function(self)
	mod:pcall(function()
		-- Устанавливаем текущее меню
		CURRENT_MENU = "crafting"
		load_menu_widgets("crafting")
		
		-- Немедленно применяем цвета
		if self._widgets_by_name then
			for widget_name, widget_data in pairs(ACTIVE_WIDGETS) do
				local widget = self._widgets_by_name[widget_name]
				if widget then
					apply_color(widget, widget_name)
				end
			end
		end
	end)
end)

mod:hook_safe("CraftingView", "update", function(self)
	if (mod._color_changed or mod._alpha_changed) and 
	   CURRENT_MENU == "crafting" and 
	   self._widgets_by_name then
		mod:pcall(function()
			for widget_name, widget_data in pairs(ACTIVE_WIDGETS) do
				local widget = self._widgets_by_name[widget_name]
				if widget then
					apply_color(widget, widget_name)
				end
			end
			mod._color_changed = false
			mod._alpha_changed = false
		end)
	end
end)

!!! НЕ УДАЛЯТЬ ЭТОТ КОММЕНТАРИЙ!!!
Игра: WH40k Darkride. Движок: модифицированный FS Stingray. LuaJit 2.1
Основная задача мода: подмена цветов в интерфейсе для перекрашивания фонов меню и кнопок.
В выпадающих списках есть все цвета из игры. Списки работают как надо.

-- delay НЕ работает! (mod:delay_function и подобное)
-- next_frame НЕ работает!
-- shedule НЕ работает!
--]]

-- CustomUIColors.lua
local mod = get_mod("CustomUIColors")

-- Реестр всех виджетов по меню
local WIDGET_REGISTRY = {}
local MENU_MODULES = mod:io_dofile("CustomUIColors/CustomUIColors_modules")
if not MENU_MODULES then
	mod:error("Failed to load module list!")
	MENU_MODULES = {}
end

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

	if not WIDGET_REGISTRY["main_menu"] then
		mod:error("Main menu module failed to load!")
	end
end

initialize_mod()

-- Текущие активные виджеты и меню
local ACTIVE_WIDGETS = {}
local CURRENT_MENU = nil

-- Флаги изменений и отложенного обновления
mod._color_changed = false
mod._alpha_changed = false
mod._hooks_created = false

mod._hooked_views = mod._hooked_views or {}
mod._pending_hooks = mod._pending_hooks or {}
mod._pending_color_update_view = nil
mod._pending_color_update_menu = nil

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

-- Получение цвета для стиля
local function get_color_for_style(widget_name, style_path)
	if CURRENT_MENU and ACTIVE_WIDGETS[widget_name] then
		local widget_data = ACTIVE_WIDGETS[widget_name]
		
		if widget_data.mapping and widget_data.mapping[style_path] then
			local map_data = widget_data.mapping[style_path]
			local color = mod:get(map_data.color_id)
			if color and color ~= "" then return color end
			return map_data.default_color or widget_data.default_color or "terminal_grid_background"
		end
		
		local setting_id = CURRENT_MENU .. "_" .. widget_name .. "_color"
		local color = mod:get(setting_id)
		if color and color ~= "" then return color end
		return widget_data.default_color or "terminal_grid_background"
	end
	return "terminal_grid_background"
end

-- Получение альфа для стиля
local function get_alpha_for_style(widget_name, style_path)
	if CURRENT_MENU and ACTIVE_WIDGETS[widget_name] and ACTIVE_WIDGETS[widget_name].supports_alpha then
		local widget_data = ACTIVE_WIDGETS[widget_name]
		
		if widget_data.mapping and widget_data.mapping[style_path] then
			local map_data = widget_data.mapping[style_path]
			local alpha = mod:get(map_data.alpha_id)
			if alpha ~= nil then return math.max(0, math.min(255, math.floor(alpha))) end
			return map_data.default_alpha or widget_data.default_alpha or 255
		end
		
		local setting_id = CURRENT_MENU .. "_" .. widget_name .. "_alpha"
		local alpha = mod:get(setting_id)
		if alpha ~= nil then return math.max(0, math.min(255, math.floor(alpha))) end
		return widget_data.default_alpha or 255
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

-- Применение цвета к одному виджету
local function apply_color(widget, widget_name)
	if not widget or not widget.style then return end
	
	local widget_data = ACTIVE_WIDGETS[widget_name]
	if not widget_data then return end
	
	if widget_data.style_ids then
		for _, style_path in ipairs(widget_data.style_ids) do
			local color_name = get_color_for_style(widget_name, style_path)
			local alpha_value = get_alpha_for_style(widget_name, style_path)
			local new_color = create_color_with_alpha(color_name, alpha_value)
			if not new_color then return end
			
			local parts = string.split(style_path, ".")
			local style = widget.style
			for i = 1, #parts - 1 do
				style = style[parts[i]]
				if not style then break end
			end
			if style and style[parts[#parts]] then
				style[parts[#parts]] = new_color
			end
		end
	end
end

-- Сбор всех виджетов из View (включая массивы)
local function collect_widgets_from_view(view)
	local all_widgets = {}
	-- Стандартные виджеты
	if view._widgets_by_name then
		for _, widget in pairs(view._widgets_by_name) do
			all_widgets[#all_widgets + 1] = widget
		end
	end
	-- Виджеты грида (InventoryView)
	if view._grid_widgets then
		for _, widget in ipairs(view._grid_widgets) do
			all_widgets[#all_widgets + 1] = widget
		end
	end
	-- Виджеты индивидуального лэйаута (InventoryView)
	if view._loadout_widgets then
		for _, widget in ipairs(view._loadout_widgets) do
			all_widgets[#all_widgets + 1] = widget
		end
	end
	-- Виджеты кошелька (InventoryView)
	if view._wallet_widgets then
		for _, widget in ipairs(view._wallet_widgets) do
			all_widgets[#all_widgets + 1] = widget
		end
	end
	-- Виджеты с восклицательными знаками (InventoryView)
	if view._exclamation_widgets then
		for _, widget in ipairs(view._exclamation_widgets) do
			all_widgets[#all_widgets + 1] = widget
		end
	end
	-- TODO: можно добавить другие известные поля при необходимости
	return all_widgets
end

-- Применение цветов ко всем собранным виджетам
local function apply_colors_to_widgets(widgets)
	for _, widget in ipairs(widgets) do
		if widget.name and ACTIVE_WIDGETS[widget.name] then
			apply_color(widget, widget.name)
		end
	end
end

-- Обновление всех виджетов в View
local function update_all(view)
	if not view then return end
	local widgets = collect_widgets_from_view(view)
	apply_colors_to_widgets(widgets)
end

-- Универсальная функция для хукания View
local function hook_view(menu_name, view_name)
	if mod._hooked_views[view_name] then return true end
	if not rawget(_G, view_name) then return false end
	
	mod:info("Attempting to hook %s for menu %s", view_name, menu_name)
	
	-- _create_widgets
	if rawget(_G[view_name], "_create_widgets") then
		pcall(function()
			mod:hook_safe(view_name, "_create_widgets", function(self)
				mod:pcall(function()
					mod:info("=== %s._create_widgets HOOK ===", view_name)
					CURRENT_MENU = menu_name
					load_menu_widgets(menu_name)
					update_all(self)
				end)
			end)
		end)
	end
	
	-- update (реакция на изменение настроек)
	if rawget(_G[view_name], "update") then
		pcall(function()
			mod:hook_safe(view_name, "update", function(self)
				if (mod._color_changed or mod._alpha_changed) and CURRENT_MENU == menu_name then
					mod:pcall(function()
						mod:info("Updating %s colors from update", view_name)
						update_all(self)
						mod._color_changed = false
						mod._alpha_changed = false
					end)
				end
			end)
		end)
	end
	
	-- on_enter (первый вход)
	if rawget(_G[view_name], "on_enter") then
		pcall(function()
			mod:hook_safe(view_name, "on_enter", function(self)
				mod:pcall(function()
					if CURRENT_MENU == menu_name then
						mod:info("Re-applying colors on_enter for %s", view_name)
						update_all(self)
					end
				end)
			end)
		end)
	end
	
	-- Специфичные методы InventoryView
	local function defer_color_update(view_instance)
		mod._pending_color_update_view = view_instance
		mod._pending_color_update_menu = menu_name
	end
	
	if rawget(_G[view_name], "_setup_grid_layout") then
		pcall(function()
			mod:hook_safe(view_name, "_setup_grid_layout", function(self, layout)
				mod:pcall(function()
					if CURRENT_MENU == menu_name then
						mod:info("%s _setup_grid_layout triggered", view_name)
						defer_color_update(self)
					end
				end)
			end)
		end)
	end
	
	if rawget(_G[view_name], "_setup_individual_layout") then
		pcall(function()
			mod:hook_safe(view_name, "_setup_individual_layout", function(self, layout)
				mod:pcall(function()
					if CURRENT_MENU == menu_name then
						mod:info("%s _setup_individual_layout triggered", view_name)
						defer_color_update(self)
					end
				end)
			end)
		end)
	end
	
	if rawget(_G[view_name], "_switch_active_layout") then
		pcall(function()
			mod:hook_safe(view_name, "_switch_active_layout", function(self, tab_context)
				mod:pcall(function()
					if CURRENT_MENU == menu_name then
						mod:info("%s _switch_active_layout triggered", view_name)
						defer_color_update(self)
					end
				end)
			end)
		end)
	end
	
	mod._hooked_views[view_name] = true
	mod:info("✓ Hooks created for %s", view_name)
	return true
end

-- Хук для ViewController
local function hook_view_controller()
	local success = pcall(function()
		mod:hook_safe("ViewController", "open_view", function(self, view_name, ...)
			mod:debug("ViewController.open_view called: %s", view_name)
			for menu_name, module in pairs(WIDGET_REGISTRY) do
				if module.VIEW_NAME == view_name then
					load_menu_widgets(menu_name)
					mod._color_changed = true
					mod:info("Switched to menu: %s -> %s", view_name, menu_name)
					
					if not mod._hooked_views[view_name] then
						if hook_view(menu_name, view_name) then
							mod._pending_hooks[view_name] = nil
						else
							mod._pending_hooks[view_name] = menu_name
							mod:debug("%s not available yet, queued for later", view_name)
						end
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
	if mod._hooks_created then return end
	hook_view_controller()
	for menu_name, module in pairs(WIDGET_REGISTRY) do
		local view_name = module.VIEW_NAME
		if view_name then
			if not hook_view(menu_name, view_name) then
				mod._pending_hooks[view_name] = menu_name
				mod:debug("%s not available yet, queued for later", view_name)
			end
		end
	end
	mod._hooks_created = true
	mod:info("All hooks created")
end

-- update для отложенных хуков и применения цветов
mod.update = function(dt)
	for view_name, menu_name in pairs(mod._pending_hooks) do
		if hook_view(menu_name, view_name) then
			mod._pending_hooks[view_name] = nil
		end
	end
	
	if mod._pending_color_update_view then
		local view = mod._pending_color_update_view
		local menu = mod._pending_color_update_menu
		if view and CURRENT_MENU == menu then
			mod:info("Applying deferred color update for %s", menu)
			update_all(view)
		end
		mod._pending_color_update_view = nil
		mod._pending_color_update_menu = nil
	end
end

-- Обработка изменений настроек
mod.on_setting_changed = function(setting_id)
	mod:debug("Setting changed: %s", setting_id)
	
	-- Проверяем настройки по всем меню
	for menu_name, module in pairs(WIDGET_REGISTRY) do
		if module.WIDGETS then
			for widget_name, widget_data in pairs(module.WIDGETS) do
				-- Новый формат: объединенный mapping
				if widget_data.mapping then
					for style_path, map_data in pairs(widget_data.mapping) do
						if map_data.color_id and setting_id == map_data.color_id then
							mod._color_changed = true
							mod:debug("Color mapping setting changed: %s", map_data.color_id)
							return
						end
						if map_data.alpha_id and setting_id == map_data.alpha_id then
							mod._alpha_changed = true
							mod:debug("Alpha mapping setting changed: %s", map_data.alpha_id)
							return
						end
					end
				end
				
				-- Обычные настройки
				local color_setting_id = menu_name .. "_" .. widget_name .. "_color"
				if setting_id == color_setting_id then
					mod._color_changed = true
					mod:debug("Color setting changed: %s", color_setting_id)
					return
				end
				
				if widget_data.supports_alpha then
					local alpha_setting_id = menu_name .. "_" .. widget_name .. "_alpha"
					if setting_id == alpha_setting_id then
						mod._alpha_changed = true
						mod:debug("Alpha setting changed: %s", alpha_setting_id)
						return
					end
				end
			end
		end
	end
	
	-- Утилиты
	if setting_id == "refresh_now" then
		mod._color_changed = true
		mod._alpha_changed = true
		mod:notify("Colors and transparency refreshed")
		return
	elseif setting_id == "reset_all_colors" then
		mod.cb_reset_all_colors()
		return
	elseif setting_id == "reload_modules" then
		mod.cb_reload_modules()
		return
	elseif setting_id == "hide_all_elements" then
		mod._alpha_changed = true
		return
	elseif setting_id == "show_all_elements" then
		mod._alpha_changed = true
		return
	end
	
	mod:debug("Unknown setting changed: %s", setting_id)
end

-- Инициализация
mod.on_enabled = function()
	create_hooks()
	mod._color_changed = true
	mod._alpha_changed = true
end

mod.on_disabled = function()
	mod._color_changed = nil
	mod._alpha_changed = nil
	mod._hooks_created = nil
	mod._hooked_views = nil
	mod._pending_hooks = nil
	mod._pending_color_update_view = nil
	mod._pending_color_update_menu = nil
	CURRENT_MENU = nil
	ACTIVE_WIDGETS = {}
	mod:notify("Custom UI Backgrounds disabled")
end

-- Утилитные функции
mod.cb_refresh_now = function()
	mod._color_changed = true
	mod._alpha_changed = true
	mod:notify("Colors and transparency refreshed")
end

mod.cb_reload_modules = function()
	mod:info("Reloading all modules...")
	load_all_modules()
	mod._color_changed = true
	mod._alpha_changed = true
	mod:notify("Modules reloaded")
end

-- DEBUG
mod.cb_reset_all_colors = function()
	mod:notify("Resetting all colors to default...")

	-- Сбрасываем настройки для всех меню
	for menu_name, module in pairs(WIDGET_REGISTRY) do
		if module.WIDGETS then
			for widget_name, widget_data in pairs(module.WIDGETS) do
				-- Сбрасываем настройки из mapping
				if widget_data.color_mapping then
					for style_path, mapping_id in pairs(widget_data.color_mapping) do
						-- Определяем дефолтный цвет для этого стиля
						local default_color = widget_data.default_color or "terminal_grid_background"
						mod:set(mapping_id, default_color)
					end
				end
				
				-- Сбрасываем обычные настройки цвета
				local color_setting_id = menu_name .. "_" .. widget_name .. "_color"
				if widget_data.default_color then
					mod:set(color_setting_id, widget_data.default_color)
				end
				
				-- Сбрасываем настройки альфа из mapping
				if widget_data.alpha_mapping then
					for style_path, mapping_id in pairs(widget_data.alpha_mapping) do
						mod:set(mapping_id, widget_data.default_alpha or 255)
					end
				end
				
				-- Сбрасываем обычные настройки альфа
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
			-- Сбрасываем обычные настройки альфа
			local alpha_setting_id = CURRENT_MENU .. "_" .. widget_name .. "_alpha"
			mod:set(alpha_setting_id, 0)
			changed = changed + 1
			
			-- Сбрасываем настройки альфа из mapping
			if widget_data.alpha_mapping then
				for style_path, mapping_id in pairs(widget_data.alpha_mapping) do
					mod:set(mapping_id, 0)
					changed = changed + 1
				end
			end
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
			-- Сбрасываем обычные настройки альфа
			local alpha_setting_id = CURRENT_MENU .. "_" .. widget_name .. "_alpha"
			mod:set(alpha_setting_id, 255)
			changed = changed + 1
			
			-- Сбрасываем настройки альфа из mapping
			if widget_data.alpha_mapping then
				for style_path, mapping_id in pairs(widget_data.alpha_mapping) do
					mod:set(mapping_id, 255)
					changed = changed + 1
				end
			end
		end
	end
	
	mod._alpha_changed = true
	mod:notify(string.format("Set %d elements to opaque", changed))
end

-- Функция для генерации и вывода ВСЕГО кода в лог
mod.cb_generate_and_log_widgets = function()
	local ui_manager = Managers and Managers.ui
	
	if not ui_manager or not ui_manager.active_top_view then
		mod:echo("❌ UI Manager not available or no active view")
		return
	end
	
	local top_view_name = ui_manager:active_top_view()
	local current_view = ui_manager:view_instance(top_view_name)
	
	if not current_view or not current_view._widgets_by_name then
		mod:echo("❌ Current view has no widgets")
		return
	end
	
	-- Определяем имя меню
	local menu_name = top_view_name:gsub("_view", ""):gsub("View", ""):lower()
	local module_name = "CUIC_" .. top_view_name
	
	mod:echo("=========================================")
	mod:echo("🛠️  GENERATING WIDGETS FOR VIEW")
	mod:echo("View: " .. top_view_name)
	mod:echo("Menu: " .. menu_name)
	mod:echo("Module: " .. module_name)
	mod:echo("Total widgets: " .. table.size(current_view._widgets_by_name))
	mod:echo("=========================================")
	
	-- Шаг 1: Выводим заголовок
	mod:echo("")
	mod:echo("📋 COPY THE ENTIRE CODE BELOW TO: Views/" .. module_name .. ".lua")
	mod:echo("")
	mod:echo("━━━━━━━━━━━━━━━━━━━━━━━━ START OF CODE ━━━━━━━━━━━━━━━━━━━━━━━━")
	mod:echo("")
	
	-- Шаг 2: Начало файла
	mod:echo("-- " .. module_name .. ".lua")
	mod:echo("-- Auto-generated widget definitions for " .. top_view_name)
	mod:echo("-- Generated: " .. os.date("%Y-%m-%d %H:%M:%S"))
	mod:echo("-- Menu: " .. menu_name)
	mod:echo("-- View: " .. top_view_name)
	mod:echo("")
	mod:echo("local mod = get_mod(\"CustomUIColors\")")
	mod:echo("")
	mod:echo("local menu_name = \"" .. menu_name .. "\"")
	mod:echo("local VIEW_NAME = \"" .. top_view_name .. "\"")
	mod:echo("")
	mod:echo("local WIDGETS = {")
	mod:echo("")
	
	-- Сортируем виджеты по алфавиту
	local sorted_widgets = {}
	for widget_name, _ in pairs(current_view._widgets_by_name) do
		table.insert(sorted_widgets, widget_name)
	end
	table.sort(sorted_widgets)
	
	local widgets_added = 0
	local total_color_styles = 0
	
	-- Шаг 3: Перебираем ВСЕ виджеты
	for _, widget_name in ipairs(sorted_widgets) do
		local widget = current_view._widgets_by_name[widget_name]
		
		if not widget or not widget.style then
			mod:echo("  -- " .. widget_name .. " (no styles)")
			mod:echo("")
			goto continue
		end
		
		-- Находим ВСЕ стили с цветами
		local color_styles = {}      -- для .color
		local text_color_styles = {} -- для .text_color
		local other_color_styles = {} -- другие цветовые поля
		
		for style_key, style_value in pairs(widget.style) do
			if type(style_value) == "table" then
				-- Проверяем ВСЕ поля на наличие цвета
				for field_name, field_value in pairs(style_value) do
					if type(field_value) == "table" and #field_value >= 3 then
						-- Это похоже на цвет [r,g,b,a]
						if field_name == "color" then
							table.insert(color_styles, style_key .. ".color")
						elseif field_name == "text_color" then
							table.insert(text_color_styles, style_key .. ".text_color")
						elseif string.find(field_name:lower(), "color") then
							table.insert(other_color_styles, style_key .. "." .. field_name)
						end
					end
				end
			end
		end
		
		-- Объединяем ВСЕ цветовые стили
		local all_color_styles = {}
		for _, style in ipairs(color_styles) do table.insert(all_color_styles, style) end
		for _, style in ipairs(text_color_styles) do table.insert(all_color_styles, style) end
		for _, style in ipairs(other_color_styles) do table.insert(all_color_styles, style) end
		
		if #all_color_styles == 0 then
			-- Виджет без цветовых стилей, но покажем информацию
			local style_count = 0
			for _ in pairs(widget.style) do style_count = style_count + 1 end
			
			mod:echo("  -- " .. widget_name .. " (" .. style_count .. " styles, no color fields)")
			
			-- Покажем все стили для информации
			local style_keys = {}
			for key, _ in pairs(widget.style) do table.insert(style_keys, key) end
			table.sort(style_keys)
			
			if #style_keys > 0 then
				mod:echo("  -- Styles: " .. table.concat(style_keys, ", "))
			end
			
			mod:echo("")
			goto continue
		end
		
		-- Шаг 4: Генерируем код для виджета с цветами
		local style_count = 0
		for _ in pairs(widget.style) do style_count = style_count + 1 end
		
		mod:echo("  -- " .. string.rep("-", 60))
		mod:echo("  -- Widget: " .. widget_name)
		mod:echo("  -- Total styles: " .. style_count)
		mod:echo("  -- Color styles: " .. #all_color_styles)
		
		-- Информация о типе виджета
		local widget_type = "unknown"
		if widget.content then
			if widget.content.hotspot then 
				widget_type = "button/hotspot"
			elseif widget.content.value then 
				widget_type = "texture/text" 
			else 
				widget_type = "container" 
			end
		end
		mod:echo("  -- Type: " .. widget_type)
		
		-- Показываем все найденные стили (для отладки)
		local all_style_keys = {}
		for key, _ in pairs(widget.style) do table.insert(all_style_keys, key) end
		table.sort(all_style_keys)
		if #all_style_keys > 0 then
			mod:echo("  -- All style keys: " .. table.concat(all_style_keys, ", "))
		end
		
		-- Начинаем блок виджета
		mod:echo("  " .. widget_name .. " = {")
		
		-- Описание
		local description = widget_name
			:gsub("_", " ")
			:gsub("^%l", string.upper)
		mod:echo("    description = \"" .. description .. "\",")
		
		-- ВСЕ цветовые стили
		mod:echo("    style_ids = {")
		for _, style_path in ipairs(all_color_styles) do
			mod:echo("      \"" .. style_path .. "\",")
		end
		mod:echo("    },")
		
		-- Определяем дефолтный цвет
		local default_color = "terminal_grid_background"
		if #text_color_styles > #color_styles then
			-- Больше текстовых цветов
			default_color = "terminal_text_body"
		elseif widget_name:find("background") or widget_name:find("frame") or widget_name:find("panel") then
			default_color = "terminal_grid_background"
		elseif widget_name:find("button") then
			default_color = "terminal_grid_background"
		elseif widget_name:find("text") or widget_name:find("title") or widget_name:find("label") or widget_name:find("name") then
			default_color = "terminal_text_body"
		elseif widget_name:find("icon") or widget_name:find("symbol") then
			default_color = "terminal_text_body"
		end
		
		mod:echo("    default_color = \"" .. default_color .. "\",")
		mod:echo("    supports_alpha = true,")
		mod:echo("    default_alpha = 255,")
		
		-- Дополнительная информация
		mod:echo("    -- Additional info:")
		mod:echo("    -- widget_type = \"" .. widget_type .. "\",")
		mod:echo("    -- total_style_keys = " .. style_count .. ",")
		mod:echo("    -- color_style_count = " .. #all_color_styles .. ",")
		
		-- Завершаем блок виджета
		mod:echo("  },")
		mod:echo("")
		
		widgets_added = widgets_added + 1
		total_color_styles = total_color_styles + #all_color_styles
		
		::continue::
	end
	
	-- Шаг 5: Завершаем файл
	mod:echo("}")
	mod:echo("")
	mod:echo("return {")
	mod:echo("  menu_name = menu_name,")
	mod:echo("  VIEW_NAME = VIEW_NAME,")
	mod:echo("  WIDGETS = WIDGETS")
	mod:echo("}")
	mod:echo("")
	mod:echo("━━━━━━━━━━━━━━━━━━━━━━━━━ END OF CODE ━━━━━━━━━━━━━━━━━━━━━━━━━")
	mod:echo("")
	
	-- Шаг 6: Выводим статистику и инструкции
	mod:echo("📊 GENERATION STATISTICS:")
	mod:echo("  Total widgets scanned: " .. #sorted_widgets)
	mod:echo("  Widgets with colors added: " .. widgets_added)
	mod:echo("  Total color style paths: " .. total_color_styles)
	mod:echo("")
	
	mod:echo("📋 COMPLETE INSTRUCTIONS:")
	mod:echo("  1. Copy ALL code above (from 'START' to 'END')")
	mod:echo("  2. Create file: CustomUIColors/Views/" .. module_name .. ".lua")
	mod:echo("  3. Paste the copied code")
	mod:echo("  4. Add to MENU_MODULES in CustomUIColors.lua:")
	mod:echo("     \"Views/" .. module_name .. "\",")
	mod:echo("  5. Reload the mod (F10 → Settings → Reload)")
	mod:echo("")
	
	-- Шаг 7: Список добавленных виджетов
	if widgets_added > 0 then
		mod:echo("🎯 WIDGETS ADDED TO FILE (" .. widgets_added .. "):")
		
		-- Повторно проходим по виджетам для списка
		local added_list = {}
		for _, widget_name in ipairs(sorted_widgets) do
			local widget = current_view._widgets_by_name[widget_name]
			if widget and widget.style then
				-- Проверяем есть ли цветовые стили
				local has_colors = false
				for _, style_value in pairs(widget.style) do
					if type(style_value) == "table" then
						for _, field_value in pairs(style_value) do
							if type(field_value) == "table" and #field_value >= 3 then
								has_colors = true
								break
							end
						end
					end
					if has_colors then break end
				end
				
				if has_colors then
					local style_count = 0
					for _ in pairs(widget.style) do style_count = style_count + 1 end
					table.insert(added_list, {name = widget_name, styles = style_count})
				end
			end
		end
		
		-- Сортируем по количеству стилей
		table.sort(added_list, function(a, b)
			return a.styles > b.styles
		end)
		
		for i, item in ipairs(added_list) do
			mod:echo(string.format("  %3d. %-35s (%d styles)", i, item.name, item.styles))
		end
	end
	
	mod:echo("")
	mod:echo("✅ GENERATION COMPLETE!")
	mod:echo("=========================================")
end

-- Функция генерации виджетов текущего вида (кнопочная версия)
mod.cb_generate_widgets_button = function()
	mod.cb_generate_and_log_widgets()
	mod:notify("Widget generation completed. Check console for output.")
end

-- Команда для консоли
mod:command("cub_gen_log", "Generate and log ALL widgets for current view", function()
	mod.cb_generate_and_log_widgets()
end)
