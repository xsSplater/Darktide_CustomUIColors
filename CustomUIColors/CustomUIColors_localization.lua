-- CustomUIColors_localization.lua
local mod = get_mod("CustomUIColors")
local InputUtils = require("scripts/managers/input/input_utils")

-- Утилитные функции для цветных списков
local function readable(text)
	local tokens = string.split(text, "_")
	for i, token in ipairs(tokens) do
		tokens[i] = string.upper(string.sub(token, 1, 1)) .. string.sub(token, 2)
	end
	return table.concat(tokens, " ")
end

-- Добавляем локализации цветов (для цветных выпадающих списков)
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

-- Основные локализации
local localizations = {
	mod_name = {
		en = "{#color(192, 255, 26)} Custom UI Colors{#reset()}",
		ru = "{#color(192, 255, 26)} Настраиваемые цвета интерфейса{#reset()}",
	},
	mod_description = {
		en = "Customize colors and transparency of UI elements in different menus.",
		ru = "Custom UI Colors - Настройка цветов и прозрачности элементов интерфейса в различных меню.",
	},


--++ Character list -- Список персонажей ++--
	main_menu_character_list_background = {
		en = " Character list",
		ru = " Список персонажей",
	},
		character_list_background_main_color = {
			en = "Background",
			ru = "Фон",
		},
			character_list_background_main_alpha = {
				en = "	Transparency",
				ru = "	Прозрачность",
			},
		character_list_background_top_border_color = {
			en = "Top border",
			ru = "Верхняя рамка",
		},
			character_list_background_top_border_alpha = {
				en = "	Transparency",
				ru = "	Прозрачность",
			},
		character_list_background_bottom_border_color = {
			en = "Bottom border",
			ru = "Нижняя рамка",
		},
			character_list_background_bottom_border_alpha = {
				en = "	Transparency",
				ru = "	Прозрачность",
			},

	--++ Character list - Mask -- Список персонажей - Маска ++--
		main_menu_character_grid_mask = {
			en = " Character list - Mask",
			ru = " Список персонажей - Маска",
		},
			main_menu_character_grid_mask_color = {
				en = "Color",
				ru = "Цвет",
			},
				main_menu_character_grid_mask_color_description = {
					en = "The general tone of the entire list of characters.",
					ru = "Общий оттенок всего списка персонажей.",
				},
			main_menu_character_grid_mask_alpha = {
				en = "	Transparency",
				ru = "	Прозрачность",
			},
				main_menu_character_grid_mask_alpha_description = {
					en = "This setting can hide the character list when set to 0.",
					ru = "Эта настройка может скрыть список персонажей при установке на 0.",
				},
	--++ Character list - Scrollbar -- Список персонажей - Полоса прокрутки ++--
		main_menu_character_grid_scrollbar = {
			en = " Character list - Scrollbar",
			ru = " Список персонажей - Полоса прокрутки",
		},
			character_grid_scrollbar_thumb_idle_color = {
				en = "Thumb",
				ru = "Ползунок полосы прокрутки",
			},
				character_grid_scrollbar_thumb_idle_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_grid_scrollbar_thumb_highlight_color = {
				en = "Thumb highlight",
				ru = "Ползунок подсвеченный",
			},
				character_grid_scrollbar_thumb_highlight_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_grid_scrollbar_track_frame_color = {
				en = "Track frame",
				ru = "Рамка полосы прокрутки",
			},
				character_grid_scrollbar_track_frame_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_grid_scrollbar_track_background_color = {
				en = "Track background",
				ru = "Фон полосы прокрутки",
			},
				character_grid_scrollbar_track_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},


--++ НАДПИСИ ++--
	--++ Character info -- Информация о персонаже ++--
		main_menu_character_info = {
			en = " Character info",
			ru = " Информация о персонаже",
		},
			character_info_style_id_1_color = {
				en = "Large class sign on the right",
				ru = "Большой знак класса справа",
			},
				character_info_style_id_1_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_info_text_archetype_text_color = {
				en = "Class name and level",
				ru = "Название класса и уровень",
			},
				character_info_text_archetype_text_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_info_text_character_text_color = {
				en = "Character name",
				ru = "Имя персонажа",
			},
				character_info_text_character_text_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},



		main_menu_friends_online = {
			en = " Friends online",
			ru = " Друзья в сети",
		},
			main_menu_friends_online_color = {
				en = "Color",
				ru = "Цвет",
			},
			main_menu_friends_online_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_slots_count = {
			en = " Slots count",
			ru = " Количество слотов",
		},
			main_menu_slots_count_color = {
				en = "Color",
				ru = "Цвет",
			},
			main_menu_slots_count_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_strike_team = {
			en = " Strike team",
			ru = " Ударная команда",
		},
			main_menu_strike_team_color = {
				en = "Color",
				ru = "Цвет",
			},
			main_menu_strike_team_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},


	--++ Кнопки ++--
		main_menu_create_button = {
			en = " Create operative button",
			ru = " Кнопка Создать оперативника",
		},
			create_button_background_default_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			create_button_background_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			create_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			create_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			create_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			create_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_play_button = {
			en = " Play button",
			ru = " Кнопка игры",
		},
			play_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			play_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			play_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			play_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			play_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			play_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},


	--++ Кнопки PSYCH WARD ++--
		main_menu_cosmetics_button = {
			en = "! Psych Ward - Cosmetics Button",
			ru = "! Psych Ward - Кнопка Интендант",
		},
			cosmetics_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			cosmetics_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			cosmetics_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			cosmetics_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			cosmetics_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			cosmetics_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_contracts_button = {
			en = "! Psych Ward - Contracts Button",
			ru = "! Psych Ward - Кнопка Контракты",
		},
			contracts_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			contracts_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			contracts_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			contracts_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			contracts_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			contracts_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_crafting_button = {
			en = "! Psych Ward - Crafting Button",
			ru = "! Psych Ward - Кнопка Кузница",
		},
			crafting_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			crafting_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			crafting_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			crafting_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			crafting_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			crafting_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_horde_button = {
			en = "! Psych Ward - Mortis Button",
			ru = "! Psych Ward - Кнопка Испытания Мортис",
		},
			horde_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			horde_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			horde_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			horde_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			horde_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			horde_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_inventory_button = {
			en = "! Psych Ward - Inventory Button",
			ru = "! Psych Ward - Кнопка Инвентарь",
		},
			inventory_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			inventory_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			inventory_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			inventory_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			inventory_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			inventory_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_meatgrinder_button = {
			en = "! Psych Ward - Meat Grinder Button",
			ru = "! Psych Ward - Кнопка Стрельбище",
		},
			meatgrinder_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			meatgrinder_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			meatgrinder_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			meatgrinder_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			meatgrinder_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			meatgrinder_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_mission_button = {
			en = "! Psych Ward - Missions Button",
			ru = "! Psych Ward - Кнопка Миссии",
		},
			mission_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			mission_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			mission_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			mission_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			mission_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			mission_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_expedition_button = {
			en = "! Psych Ward - Expeditions Button",
			ru = "! Psych Ward - Кнопка Экспедиции",
		},
			expedition_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			expedition_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			expedition_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			expedition_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			expedition_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			expedition_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_penance_button = {
			en = "! Psych Ward - Penance Button",
			ru = "! Psych Ward - Кнопка искуплений",
		},
			penance_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			penance_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			penance_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			penance_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			penance_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			penance_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_vendor_button = {
			en = "! Psych Ward - Armoury Button",
			ru = "! Psych Ward - Кнопка Оружейная",
		},
			vendor_button_background_color = {
				en = "Background color",
				ru = "Цвет фона",
			},
			vendor_button_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			vendor_button_background_gradient_color = {
				en = "Background gradient color",
				ru = "Цвет градиента",
			},
			vendor_button_background_gradient_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
			vendor_button_outer_shadow_color = {
				en = "Outer shadow сolor",
				ru = "Цвет внешней тени",
			},
			vendor_button_outer_shadow_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
			},
		main_menu_difficulty_stepper = {
			en = "! Psych Ward - Difficulty stepper",
			ru = "! Psych Ward - Выбор сложности",
		},
			main_menu_difficulty_stepper_color = {
				en = "Color",
				ru = "Цвет",
			},
			main_menu_difficulty_stepper_alpha = {
				en = "Transparency",
				ru = "Прозрачность",
			},


--++ Textures -- Текстуры ++--
	main_menu_background_left = {
		en = " Textures - Background smoke",
		ru = " Текстуры - Фоновый дым слева",
	},
		main_menu_background_left_color = {
			en = "Color",
			ru = "Цвет",
		},
			main_menu_background_left_color_description = {
				en = "The color of the smoke in the Main menu, which is located on the left under the list of characters.",
				ru = "Цвет дыма в главном меню, который расположен слева под списком персонажей.",
			},
				main_menu_background_left_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					main_menu_background_left_alpha_description = {
						en = "0 = fully transparent, 255 = fully opaque",
						ru = "0 = полная прозрачность, 255 = полная видимость",
					},

	main_menu_metal_corners = {
		en = " Textures - Metal corners",
		ru = " Текстуры - Металлические углы",
	},
		main_menu_metal_corners_color = {
			en = "Color",
			ru = "Цвет",
		},
			main_menu_metal_corners_color_description = {
				en = "The color of the metallic decorations on the corners of the screen.",
				ru = "Цвет металлических украшений по углам экрана.",
			},
				main_menu_metal_corners_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					main_menu_metal_corners_alpha_description = {
						en = "0 = fully transparent, 255 = fully opaque",
						ru = "0 = полная прозрачность, 255 = полная видимость",
					},


	main_menu_wallet_element_background = {
		en = " Textures - Wallet background",
		ru = " Текстуры - Фон кошелька",
	},
		main_menu_wallet_element_background_color = {
			en = "Color",
			ru = "Цвет",
		},
				main_menu_wallet_element_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					main_menu_wallet_element_background_alpha_description = {
						en = "0 = fully transparent, 255 = fully opaque",
						ru = "0 = полная прозрачность, 255 = полная видимость",
					},


	--++ Character list - Slots -- Список персонажей - Ячейки ++--
		--++ Slot 1 -- Ячейка 1 ++--
		main_menu_character_slot_1 = {
			en = " Character list - Slot 1",
			ru = " Список персонажей - Ячейка 1",
		},
			character_slot_1_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_1_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_1_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_1_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_1_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_1_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_1_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_1_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_1_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_1_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_1_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_1_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_1_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_1_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_1_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_1_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_1_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_1_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_1_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_1_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_1_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_1_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_1_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_1_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_1_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_1_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 2 -- Ячейка 2 ++--
		main_menu_character_slot_2 = {
			en = " Character list - Slot 2",
			ru = " Список персонажей - Ячейка 2",
		},
			character_slot_2_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_2_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_2_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_2_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_2_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_2_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_2_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_2_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_2_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_2_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_2_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_2_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_2_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_2_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_2_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_2_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_2_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_2_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_2_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_2_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_2_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_2_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_2_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_2_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_2_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_2_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 3 -- Ячейка 3 ++--
		main_menu_character_slot_3 = {
			en = " Character list - Slot 3",
			ru = " Список персонажей - Ячейка 3",
		},
			character_slot_3_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_3_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_3_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_3_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_3_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_3_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_3_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_3_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_3_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_3_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_3_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_3_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_3_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_3_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_3_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_3_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_3_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_3_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_3_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_3_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_3_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_3_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_3_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_3_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_3_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_3_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 4 -- Ячейка 4 ++--
		main_menu_character_slot_4 = {
			en = " Character list - Slot 4",
			ru = " Список персонажей - Ячейка 4",
		},
			character_slot_4_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_4_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_4_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_4_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_4_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_4_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_4_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_4_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_4_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_4_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_4_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_4_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_4_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_4_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_4_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_4_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_4_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_4_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_4_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_4_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_4_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_4_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_4_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_4_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_4_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_4_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 5 -- Ячейка 5 ++--
		main_menu_character_slot_5 = {
			en = " Character list - Slot 5",
			ru = " Список персонажей - Ячейка 5",
		},
			character_slot_5_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_5_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_5_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_5_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_5_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_5_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_5_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_5_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_5_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_5_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_5_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_5_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_5_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_5_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_5_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_5_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_5_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_5_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_5_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_5_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_5_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_5_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_5_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_5_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_5_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_5_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 6 -- Ячейка 6 ++--
		main_menu_character_slot_6 = {
			en = " Character list - Slot 6",
			ru = " Список персонажей - Ячейка 6",
		},
			character_slot_6_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_6_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_6_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_6_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_6_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_6_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_6_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_6_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_6_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_6_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_6_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_6_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_6_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_6_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_6_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_6_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_6_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_6_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_6_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_6_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_6_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_6_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_6_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_6_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_6_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_6_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 7 -- Ячейка 7 ++--
		main_menu_character_slot_7 = {
			en = " Character list - Slot 7",
			ru = " Список персонажей - Ячейка 7",
		},
			character_slot_7_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_7_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_7_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_7_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_7_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_7_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_7_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_7_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_7_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_7_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_7_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_7_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_7_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_7_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_7_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_7_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_7_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_7_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_7_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_7_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_7_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_7_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_7_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_7_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_7_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_7_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 8 -- Ячейка 8 ++--
		main_menu_character_slot_8 = {
			en = " Character list - Slot 8",
			ru = " Список персонажей - Ячейка 8",
		},
			character_slot_8_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_8_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_8_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_8_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_8_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_8_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_8_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_8_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_8_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_8_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_8_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_8_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_8_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_8_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_8_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_8_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_8_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_8_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_8_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_8_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_8_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_8_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_8_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_8_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_8_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_8_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
		--++ Slot 9 -- Ячейка 9 ++--
		main_menu_character_slot_9 = {
			en = " Character list - Slot 9",
			ru = " Список персонажей - Ячейка 9",
		},
			character_slot_9_archetype_icon_selected_color = {
				en = "Archetype icon selected",
				ru = "Значок класса выбранный",
			},
				character_slot_9_archetype_icon_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_archetype_icon_hover_color = {
				en = "Archetype icon on hover",
				ru = "Значок класса при наведении",
			},
				character_slot_9_archetype_icon_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_background_color = {
				en = "Background selected",
				ru = "Фон выбранной ячейки",
			},
				character_slot_9_background_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_background_gradient_hover_color = {
				en = "Background gradient on hover",
				ru = "Фон-градиент при наведении",
			},
				character_slot_9_background_gradient_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_background_gradient_selected_color = {
				en = "Background gradient selected",
				ru = "Фон-градиент выбранной ячейки",
			},
				character_slot_9_background_gradient_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_character_archetype_title_default_color = {
				en = "Archetype title",
				ru = "Название класса",
			},
				character_slot_9_character_archetype_title_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_character_archetype_title_hover_color = {
				en = "Archetype title on hover",
				ru = "Название класса выбранного",
			},
				character_slot_9_character_archetype_title_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_character_insignia_color = {
				en = "Character insignia",
				ru = "Орден персонажа",
			},
				character_slot_9_character_insignia_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_character_name_default_color = {
				en = "Character name default",
				ru = "Имя персонажа по умолчанию",
			},
				character_slot_9_character_name_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_character_name_hover_color = {
				en = "Character name on hover",
				ru = "Имя персонажа при наведении",
			},
				character_slot_9_character_name_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_character_portrait_color = {
				en = "Character portrait",
				ru = "Портрет персонажа",
			},
				character_slot_9_character_portrait_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
					character_slot_9_contracts_text_default_color = {					--! BETTER MELK
						en = "! Better Melk\nContracts text",
						ru = "! Better Melk\nКонтракты текст",
					},
						character_slot_9_contracts_text_default_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
					character_slot_9_contracts_text_hover_color = {						--! BETTER MELK
						en = "! Better Melk\nContracts text on hover",
						ru = "! Better Melk\nКонтракты текст при наведении",
					},
						character_slot_9_contracts_text_hover_alpha = {
							en = "	Transparency",
							ru = "	Прозрачность",
						},
			character_slot_9_corner_hover_color = {
				en = "Corner on hover",
				ru = "Углы при наведении",
			},
				character_slot_9_corner_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_corner_selected_color = {
				en = "Corner selected",
				ru = "Углы выбранный",
			},
				character_slot_9_corner_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_frame_hover_color = {
				en = "Frame on hover",
				ru = "Углы выбранный",
			},
				character_slot_9_frame_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_frame_selected_color = {
				en = "Frame selected",
				ru = "Углы выбранный",
			},
				character_slot_9_frame_selected_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_style_id_7_color = {
				en = "Bottom divider",
				ru = "Нижний разделитель",
			},
				character_slot_9_style_id_7_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_style_id_8_color = {
				en = "Top divider",
				ru = "Верхний разделитель",
			},
				character_slot_9_style_id_8_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_style_id_13_default_color = {
				en = "Top title",
				ru = "Звание",
			},
				character_slot_9_style_id_13_default_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},
			character_slot_9_style_id_13_hover_color = {
				en = "Top title on hover",
				ru = "Звание при наведении",
			},
				character_slot_9_style_id_13_hover_alpha = {
					en = "	Transparency",
					ru = "	Прозрачность",
				},


--+++ ГРУППА УТИЛИТ +++--
	utility_settings = {
		en = " UTILITY",
		ru = " УТИЛИТЫ",
	},
		--++ Кнопки утилит ++--
		generate_widgets = {
			en = "Generate widgets file",
			ru = "Создать файл виджетов",
		},
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
		hide_all_elements = {
			en = "Hide all elements",
			ru = "Скрыть все элементы",
		},
		show_all_elements = {
			en = "Show all elements",
			ru = "Показать все элементы",
		},
}

-- Добавляем цветные локализации
add_color_localizations(localizations)

localizations["Color"] = {
	en = "Color",
	ru = "Цвет",
}
localizations["Transparency"] = {
	en = "	Transparency",
	ru = "	Прозрачность",
}

return localizations
