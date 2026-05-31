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
			{ text = "online_green",					value = "online_green" },
		}
	end
	return color_options
end

-- Создаем настройки для виджета
local function create_widget_settings(menu_name, widget_name, widget_data)
	local settings = {}

	-- Проверяем есть ли mapping
	local has_mapping = widget_data.mapping and table.size(widget_data.mapping) > 0
	
	if not has_mapping then
		-- Обычный виджет (без mapping)
		table.insert(settings, {
			setting_id = menu_name .. "_" .. widget_name .. "_color",
			type = "dropdown",
			default_value = widget_data.default_color or "terminal_grid_background",
			options = get_color_options()
		})
		
		if widget_data.supports_alpha then
			table.insert(settings, {
				setting_id = menu_name .. "_" .. widget_name .. "_alpha",
				type = "numeric",
				default_value = widget_data.default_alpha or 255,
				range = {0, 255},
				step_size_value = 5,
			})
		end
	else
		-- Виджет с объединенным mapping
		for style_path, map_data in pairs(widget_data.mapping) do
			-- Настройка цвета
			table.insert(settings, {
				setting_id = map_data.color_id,
				type = "dropdown",
				default_value = map_data.default_color or widget_data.default_color or "terminal_grid_background",
				options = get_color_options()
			})
			
			-- Настройка прозрачности
			if widget_data.supports_alpha then
				table.insert(settings, {
					setting_id = map_data.alpha_id,
					type = "numeric",
					default_value = map_data.default_alpha or widget_data.default_alpha or 255,
					range = {0, 255},
					step_size_value = 5,
				})
			end
		end
	end

	return settings
end

-- Загружаем модули для генерации настроек
local function load_modules_for_settings()
	local modules = {}
	local module_paths = mod:io_dofile("CustomUIColors/CustomUIColors_modules")
	if not module_paths then
		mod:error("Failed to load module list for settings!")
		return modules
	end

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

	-- Если есть WIDGET_ORDER - используем его
	if module.WIDGET_ORDER then
		-- Используем ваш порядок
		for _, widget_name in ipairs(module.WIDGET_ORDER) do
			local widget_data = module.WIDGETS[widget_name]
			if widget_data then
				local widget_settings = create_widget_settings(menu_name, widget_name, widget_data)
				if #widget_settings > 0 then
					table.insert(group_widgets, {
						setting_id = menu_name .. "_" .. widget_name,
						type = "group",
						sub_widgets = widget_settings
					})
				end
			end
		end
	else
		-- Или просто в порядке как есть в таблице WIDGETS
		for widget_name, widget_data in pairs(module.WIDGETS) do
			local widget_settings = create_widget_settings(menu_name, widget_name, widget_data)
			if #widget_settings > 0 then
				table.insert(group_widgets, {
					setting_id = menu_name .. "_" .. widget_name,
					type = "group",
					sub_widgets = widget_settings
				})
			end
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
	if menu_group and menu_group.sub_widgets then
		for _, widget_group in ipairs(menu_group.sub_widgets) do
			table.insert(options.options.widgets, widget_group)
		end
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
			setting_id = "generate_widgets",
			type = "keybind",
			default_value = {},
			keybind_trigger = "pressed",
			keybind_type = "function_call",
			function_name = "cb_generate_widgets_button",
			tooltip = "Generate widgets file for current view\nOutput will be shown in console"
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
