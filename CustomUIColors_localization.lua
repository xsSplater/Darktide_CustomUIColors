-- CustomUIColors_localization.lua
local mod = get_mod("CustomUIColors")
local InputUtils = require("scripts/managers/input/input_utils")

-- Загружаем модули для локализации
local function load_modules_for_localization()
	local modules = {}
	local module_paths = {
		"Views/CUIC_MainMenuView",
		-- "Views/CUIC_CraftingView"
	}

	for _, path in ipairs(module_paths) do
		local success, module = pcall(function()
			return mod:io_dofile("CustomUIColors/" .. path)
		end)
		
		if success and module then
			local menu_name = module.menu_name
			if menu_name then
				modules[menu_name] = module
				mod:debug("Loaded module for localization: %s -> %s", path, menu_name)
			else
				mod:error("Module %s has no menu_name field", path)
			end
		end
	end

	return modules
end

local WIDGET_MODULES = load_modules_for_localization()

-- Утилитные функции
local function readable(text)
	local tokens = string.split(text, "_")
	for i, token in ipairs(tokens) do
		tokens[i] = string.upper(string.sub(token, 1, 1)) .. string.sub(token, 2)
	end
	return table.concat(tokens, " ")
end

-- Добавляем локализации цветов
local function add_color_localizations(localizations)
	if Color and Color.list then
		for _, color_name in ipairs(Color.list) do
			local color_values = Color[color_name](255, true)
			if color_values then
				local text = InputUtils.apply_color_to_input_text(readable(color_name), color_values)
				localizations[color_name] = { 
					en = text,
					ru = text,
				}
			end
		end
	else
		local basic_colors = {
			"terminal_grid_background", "terminal_background", "terminal_background_gradient",
			"ui_green_light", "black", "white", "terminal_text_body", "terminal_text_header",
			"terminal_text_body_sub_header", "red", "blue", "green", "yellow", "purple", "orange",
		}
		
		for _, color_name in ipairs(basic_colors) do
			localizations[color_name] = {
				en = readable(color_name),
				ru = readable(color_name),
			}
		end
	end
end

-- Добавляем локализации для меню
local function add_menu_localizations(localizations)
	for menu_name, module in pairs(WIDGET_MODULES) do
		if module.WIDGETS then
			local menu_display_name = readable(menu_name)
			local menu_setting_id = menu_name .. "_settings"
			
			localizations[menu_setting_id] = {
				en = menu_display_name .. " Settings",
				ru = "Настройки " .. menu_display_name,
			}
			
			-- Локализация для каждого виджета
			for widget_name, widget_data in pairs(module.WIDGETS) do
				local color_setting_id = menu_name .. "_" .. widget_name .. "_color"
				local alpha_setting_id = menu_name .. "_" .. widget_name .. "_alpha"
				local group_setting_id = menu_name .. "_" .. widget_name .. "_settings"
				
				-- Локализация группы настроек виджета
				localizations[group_setting_id] = {
					en = widget_data.description,
					ru = widget_data.description,
				}
				
				-- Локализация отдельных настроек
				localizations[color_setting_id] = {
					en = "Color",
					ru = "Цвет",
				}
				
				if widget_data.supports_alpha then
					localizations[alpha_setting_id] = {
						en = "Transparency",
						ru = "Прозрачность",
					}
				end
			end
		end
	end
end

-- Основные локализации
local localizations = {
	mod_name = {
		en = "Custom UI Colors",
		ru = "Настраиваемые цвета интерфейса",
	},
	mod_description = {
		en = "Customize colors and transparency of UI elements in different menus",
		ru = "Custom UI Colors - Настройка цветов и прозрачности элементов интерфейса в различных меню",
	},


--+++ ГЛАВНОЕ МЕНЮ +++--
	--++ Список персонажей ++--
		main_menu_character_list_background = {
			en = "Character grid - Background",
			ru = "Cписок персонажей - Фон",
		},
		main_menu_character_grid_mask = {
			en = "Character grid - Mask"
				.."{#size(17)}{#color(95, 95, 95)} of the selected color is applied to the entire Character selection window{#reset()}",
			ru = "Cписок персонажей - Маска"
				.."\n{#size(17)}{#color(95, 95, 95)} выбранного цвета накладывается на всё окно выбора персонажей{#reset()}",
		},
		main_menu_character_grid_scrollbar = {
			en = "Character grid - Scrollbar",
			ru = "Cписок персонажей - Полоса прокрутки",
		},
	--++ Слоты персонажей ++--
		main_menu_character_slot_1 = {
			en = "Character grid - Slot 1",
			ru = "Cписок персонажей - Слот 1",
		},
		main_menu_character_slot_2 = {
			en = "Character grid - Slot 2",
			ru = "Cписок персонажей - Слот 2",
		},
		main_menu_character_slot_3 = {
			en = "Character grid - Slot 3",
			ru = "Cписок персонажей - Слот 3",
		},
		main_menu_character_slot_4 = {
			en = "Character grid - Slot 4",
			ru = "Cписок персонажей - Слот 4",
		},
		main_menu_character_slot_5 = {
			en = "Character grid - Slot 5",
			ru = "Cписок персонажей - Слот 5",
		},
		main_menu_character_slot_6 = {
			en = "Character grid - Slot 6",
			ru = "Cписок персонажей - Слот 6",
		},
		main_menu_character_slot_7 = {
			en = "Character grid - Slot 7",
			ru = "Cписок персонажей - Слот 7",
		},
		main_menu_character_slot_8 = {
			en = "Character grid - Slot 8",
			ru = "Cписок персонажей - Слот 8",
		},
		main_menu_character_slot_9 = {
			en = "Character grid - Slot 9",
			ru = "Cписок персонажей - Слот 9",
		},


	--++ Надписи ++--
		main_menu_character_info = {
			en = "Text - Character name, icon and class",
			ru = "Текст - Имя персонажа, знак и класс",
		},
		main_menu_friends_online = {
			en = "Text - Friends online",
			ru = "Текст - Друзей в сети",
		},
		main_menu_slots_count = {
			en = "Text - Remaining operative slots",
			ru = "Текст - Оставшиеся слоты оперативника",
		},
		main_menu_strike_team = {
			en = "Text - Strike team",
			ru = "Текст - Ударная команда",
		},


	--++ Кнопки ++--
		main_menu_create_button = {
			en = "Buttons - Create operative",
			ru = "Кнопки - Создать оперативника",
		},
		main_menu_play_button = {
			en = "Buttons - Start",
			ru = "Кнопки - Начать",
		},


	--++ Кнопки PSYCH WARD ++--
		main_menu_cosmetics_button = {
			en = "Psych Ward - Buttons - Cosmetics",
			ru = "Психушка - Кнопки - Интендант",
		},
		main_menu_contracts_button = {
			en = "Psych Ward - Buttons - Contracts",
			ru = "Психушка - Кнопки - Контракты",
		},
		main_menu_crafting_button = {
			en = "Psych Ward - Buttons - Crafting",
			ru = "Психушка - Кнопки - Кузница",
		},
		main_menu_horde_button = {
			en = "Psych Ward - Buttons - Mortis Trials",
			ru = "Психушка - Кнопки - Испытания Мортис",
		},
		main_menu_inventory_button = {
			en = "Psych Ward - Buttons - Inventory",
			ru = "Психушка - Кнопки - Инвентарь",
		},
		main_menu_meatgrinder_button = {
			en = "Psych Ward - Buttons - Meat Grinder",
			ru = "Психушка - Кнопки - Стрельбище",
		},
		main_menu_mission_button = {
			en = "Psych Ward - Buttons - Mission",
			ru = "Психушка - Кнопки - Миссии",
		},
		main_menu_penance_button = {
			en = "Psych Ward - Buttons - Penance",
			ru = "Психушка - Кнопки - Искупления",
		},
		main_menu_vendor_button = {
			en = "Psych Ward - Buttons - Armoury",
			ru = "Психушка - Кнопки - Оружейная",
		},
		main_menu_difficulty_stepper = {
			en = "Psych Ward - Difficulty stepper",
			ru = "Психушка - Выбор сложности",
		},


	--++ Текстуры ++--
		main_menu_background_left = {
			en = "Textures - Background smoke on the left",
			ru = "Текстуры - Фоновый дым слева",
		},
		main_menu_metal_corners = {
			en = "Textures - Metal corners",
			ru = "Текстуры - Металлические углы",
		},
		main_menu_wallet_element_background = {
			en = "Textures - Wallet Background",
			ru = "Текстуры - Фон кошелька",
		},


--+++ МЕНЮ КУЗНИЦЫ +++--



--+++ ГРУППА УТИЛИТ +++--
	utility_settings = {
		en = "Utility",
		ru = "Утилиты",
	},
		--++ Кнопки утилит ++--
		refresh_now = {
			en = "Force refresh",
			ru = "Принудительное обновление",
		},
		reset_all_colors = {
			en = "Reset all colors",
			ru = "Сбросить все цвета",
		},
		reload_modules = {
			en = "Reload modules",
			ru = "Перезагрузить модули",
		},
		debug_info = {
			en = "Debug info",
			ru = "Отладочная информация",
		},
		hide_all_elements = {
			en = "Hide all elements",
			ru = "Скрыть все элементы",
		},
		show_all_elements = {
			en = "Show all elements",
			ru = "Показать все элементы",
		},
}

add_color_localizations(localizations)
add_menu_localizations(localizations)

localizations["main_menu_settings"] = {
	en = " MAIN MENU SETTINGS",
	ru = " НАСТРОЙКИ ГЛАВНОГО МЕНЮ",
}
localizations["crafting_settings"] = {
	en = " CRAFTING MENU SETTINGS",
	ru = " НАСТРОЙКИ МЕНЮ КРАФТА",
}

return localizations
