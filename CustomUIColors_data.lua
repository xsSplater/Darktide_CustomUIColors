-- CustomUIColors_data.lua
local mod = get_mod("CustomUIColors")

-- Получаем список всех цветов
local function get_color_options()
	local color_options = {}
	if Color and Color.list then
		for _, color_name in ipairs(Color.list) do
			table.insert(color_options, {
				text = color_name,
				value = color_name
			})
		end
		table.sort(color_options, function(a, b)
			return a.text < b.text
		end)
	else
		-- Основные цвета по умолчанию
		color_options = {
			{ text = "terminal_grid_background",		value = "terminal_grid_background" },
			{ text = "terminal_background",				value = "terminal_background" },
			{ text = "terminal_background_gradient",	value = "terminal_background_gradient" },
			{ text = "ui_green_light",					value = "ui_green_light" },
			{ text = "black",							value = "black" },
			{ text = "white",							value = "white" },
			{ text = "red",								value = "red" },
			{ text = "blue",							value = "blue" },
			{ text = "green",							value = "green" },
			{ text = "yellow",							value = "yellow" },
			{ text = "purple",							value = "purple" },
			{ text = "orange",							value = "orange" },
			{ text = "terminal_text_body",				value = "terminal_text_body" },
			{ text = "terminal_text_header",			value = "terminal_text_header" },
			{ text = "terminal_text_body_sub_header",	value = "terminal_text_body_sub_header" },
		}
	end
	return color_options
end

-- Создаем настройки для виджета
local function create_widget_settings(menu_name, widget_name, widget_data)
	local color_options = get_color_options()

	-- Настройка цвета
	local color_setting = {
		setting_id = menu_name .. "_" .. widget_name .. "_color",
		type = "dropdown",
		default_value = widget_data.default_color or "terminal_grid_background",
		options = color_options
	}

	-- Настройка прозрачности (если виджет поддерживает)
	local settings = {color_setting}

	if widget_data.supports_alpha then
		table.insert(settings, {
			setting_id = menu_name .. "_" .. widget_name .. "_alpha",
			type = "numeric",
			default_value = widget_data.default_alpha or 255,
			range = {0, 255},
			step_size_value = 5,
			tooltip = "0 = fully transparent,\n255 = fully opaque"
		})
	end

	return settings
end

-- Загружаем модули для генерации настроек
local function load_modules_for_settings()
	local modules = {}
	local module_paths = {
		"Views/CUIC_MainMenuView",
		-- "Views/CUIC_CraftingView"
	}

	for _, module_path in ipairs(module_paths) do
		local success, module = pcall(function()
			return mod:io_dofile("CustomUIColors/" .. module_path)
		end)

		if success and module then
			local menu_name = module.menu_name
			if menu_name then
				modules[menu_name] = module
				mod:debug("Loaded module for settings: %s -> %s", module_path, menu_name)
			else
				mod:error("Module %s has no menu_name field", module_path)
			end
		end
	end

	return modules
end

-- Загружаем модули
local WIDGET_REGISTRY = load_modules_for_settings()

-- Создаем группу настроек для меню
local function create_menu_settings_group(menu_name, module)
	if not module or not module.WIDGETS then
		return nil
	end

	local group_widgets = {}

	-- Сортируем виджеты по алфавиту для удобства
	local sorted_widgets = {}
	for widget_name, _ in pairs(module.WIDGETS) do
		table.insert(sorted_widgets, widget_name)
	end
	table.sort(sorted_widgets)

	for _, widget_name in ipairs(sorted_widgets) do
		local widget_data = module.WIDGETS[widget_name]
		
		-- Создаем группу для каждого виджета
		local widget_settings = create_widget_settings(menu_name, widget_name, widget_data)
		
		if #widget_settings > 0 then
			table.insert(group_widgets, {
				setting_id = menu_name .. "_" .. widget_name,
				type = "group",
				sub_widgets = widget_settings
			})
		end
	end

	if #group_widgets == 0 then
		return nil
	end

	return {
		setting_id = menu_name .. "_settings",
		type = "group",
		sub_widgets = group_widgets
	}
end

-- Основная конфигурация
local options = {
	name = mod:localize("mod_name"),
	description = mod:localize("mod_description"),
	is_togglable = true,
	options = {
		widgets = {}
	}
}

-- Добавляем настройки для каждого меню
for menu_name, module in pairs(WIDGET_REGISTRY) do
	local menu_group = create_menu_settings_group(menu_name, module)
	if menu_group then
		table.insert(options.options.widgets, menu_group)
	end
end

-- Добавляем утилиты
table.insert(options.options.widgets, {
	setting_id = "utility_settings",
	type = "group",
	sub_widgets = {
		{
			setting_id = "refresh_now",
			type = "keybind",
			default_value = {},
			keybind_trigger = "pressed",
			keybind_type = "function_call",
			function_name = "cb_refresh_now",
			tooltip = "Force refresh all colors"
		},
		{
			setting_id = "reset_all_colors",
			type = "keybind",
			default_value = {},
			keybind_trigger = "held",
			keybind_type = "function_call",
			function_name = "cb_reset_all_colors",
			tooltip = "Reset all colors to default"
		},
		{
			setting_id = "reload_modules",
			type = "keybind",
			default_value = {},
			keybind_trigger = "pressed",
			keybind_type = "function_call",
			function_name = "cb_reload_modules",
			tooltip = "Reload all menu modules"
		},

		{
			setting_id = "hide_all_elements",
			type = "keybind",
			default_value = {},
			keybind_trigger = "pressed",
			keybind_type = "function_call",
			function_name = "cb_hide_all_elements",
			tooltip = "Set all elements to transparent"
		},
		{
			setting_id = "show_all_elements",
			type = "keybind",
			default_value = {},
			keybind_trigger = "pressed",
			keybind_type = "function_call",
			function_name = "cb_show_all_elements",
			tooltip = "Set all elements to opaque"
		},
	}
})

return options
