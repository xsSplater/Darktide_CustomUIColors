-- Views/CUIC_MainMenuView.lua
local mod = get_mod("CustomUIColors")

local menu_name = "main_menu"
local VIEW_NAME = "MainMenuView"

-- Порядок виджетов
local WIDGET_ORDER = {
	-- Character List -- Список персонажей
	"character_list_background",
	"character_grid_mask",
	"character_grid_scrollbar",

	-- Main Buttons -- Основные кнопки
	"create_button",
	"play_button",

	-- Textures -- Текстуры
	"background_left",
	"metal_corners",
	"wallet_element_background",

	-- Character Info -- Информация о персонаже
	"character_info",

	-- Text Info -- Текстовая информация
	"friends_online",
	"strike_team",
	"slots_count",

	-- Psych Ward -- Психушка
	"cosmetics_button",
	"penance_button",
	"contracts_button",
	"horde_button",
	"meatgrinder_button",
	"mission_button",
	"expedition_button",
	"inventory_button",
	"crafting_button",
	"vendor_button",
	"difficulty_stepper",

	-- Character Slots -- Ячейки персонажей
	"character_slot_1",
	"character_slot_2",
	"character_slot_3",
	"character_slot_4",
	"character_slot_5",
	"character_slot_6",
	"character_slot_7",
	"character_slot_8",
	"character_slot_9",
}


local WIDGETS = {
-- CHARACTER LIST -- СПИСОК ПЕРСОНАЖЕЙ
	character_list_background = {
		style_ids = {
			"background.color",
			"style_id_2.color",
			"style_id_3.color",
		},
		supports_alpha = true,
		mapping = {
			["background.color"] = {									-- Цвет фона
				color_id = "character_list_background_main_color",
				alpha_id = "character_list_background_main_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["style_id_2.color"] = {									-- Рамка сверху
				color_id = "character_list_background_top_border_color",
				alpha_id = "character_list_background_top_border_alpha",
				default_color = "white",
				default_alpha = 0
			},
			["style_id_3.color"] = {									-- Рамка снизу
				color_id = "character_list_background_bottom_border_color",
				alpha_id = "character_list_background_bottom_border_alpha",
				default_color = "white",
				default_alpha = 0
			},
		},
	},
	character_grid_mask = {
		style_ids = { "style_id_1.color" },
		default_color = "white",
		supports_alpha = true,
		default_alpha = 255,
	},
	character_grid_scrollbar = {
		style_ids = {
			"thumb.idle_color",
			"thumb.highlight_color",
			"track_frame.color",
			"track_background.color",
		},
		supports_alpha = true,
		mapping = {
			["thumb.idle_color"] = {								-- Цвет ползунка
				color_id = "character_grid_scrollbar_thumb_idle_color",
				alpha_id = "character_grid_scrollbar_thumb_idle_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["thumb.highlight_color"] = {							-- Подсветка при наведении
				color_id = "character_grid_scrollbar_thumb_highlight_color",
				alpha_id = "character_grid_scrollbar_thumb_highlight_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["track_frame.color"] = {								-- Цвет рамки
				color_id = "character_grid_scrollbar_track_frame_color",
				alpha_id = "character_grid_scrollbar_track_frame_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["track_background.color"] = {							-- Цвет фона
				color_id = "character_grid_scrollbar_track_background_color",
				alpha_id = "character_grid_scrollbar_track_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
		},
	},
	character_info = {
		style_ids = {
			"style_id_1.color",
			"text_archetype.text_color",
			"text_character.text_color",
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {							-- Большой знак класса
				color_id = "character_info_style_id_1_color",
				alpha_id = "character_info_style_id_1_alpha",
				default_color = "gold",
				default_alpha = 255
			},
			["text_archetype.text_color"] = {					-- Значок малый и название класса
				color_id = "character_info_text_archetype_text_color",
				alpha_id = "character_info_text_archetype_text_alpha",
				default_color = "terminal_text_body",
				default_alpha = 255
			},
			["text_character.text_color"] = {					-- Имя персонажа
				color_id = "character_info_text_character_text_color",
				alpha_id = "character_info_text_character_text_alpha",
				default_color = "white",
				default_alpha = 255
			},
		},
	},


-- BUTTONS --
	-- Widget: create_button
	-- Other style keys:
		-- "background.color",
		-- "background.selected_color",
		-- "background_gradient.color",
		-- "background_gradient.disabled_color",
		-- "background_gradient.selected_color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.disabled_color",
		-- "corner.hover_color",
		-- "corner.selected_color",
		-- "frame.color",
		-- "frame.default_color",
		-- "frame.disabled_color",
		-- "frame.hover_color",
		-- "frame.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.hover_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
	create_button = {
		style_ids = {
			"background.default_color",
			"background_gradient.default_color",
			"outer_shadow.color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "create_button_background_default_color",
				alpha_id = "create_button_background_default_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.default_color"] = {
				color_id = "create_button_background_gradient_color",
				alpha_id = "create_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "create_button_outer_shadow_color",
				alpha_id = "create_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: play_button
	-- Other style keys:
		-- "background.color",
		-- "background_gradient.color",
		-- "corner.color",
		-- "corner.default_color", -- Углы
		-- "corner.hover_color", -- Углы при наведении
		-- "frame.color",
		-- "frame.default_color", -- Рамка
		-- "frame.hover_color", -- Рамка при наведении
		-- "style_id_2.color", -- Маска ???
		-- "style_id_3.color", -- Рамка вокруг кнопки
		-- "style_id_8.color", -- ???
		-- "text.text_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
		-- "text.default_text_color",
		-- "text.default_color", -- Текст
		-- "text.disabled_color",
	play_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background_gradient.color"] = {
				color_id = "play_button_background_gradient_color",
				alpha_id = "play_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "play_button_outer_shadow_color",
				alpha_id = "play_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
			["background.default_color"] = {
				color_id = "play_button_background_color",
				alpha_id = "play_button_background_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},


-- TEXT
	-- Widget: slots_count
	-- Other style keys:
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_text_color",
	slots_count = {
		style_ids = {
			"text.text_color",
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: friends_online
	-- Other style keys:
		-- "icon.disabled_text_color",
		-- "text.disabled_text_color",
		-- "text_count.disabled_text_color",
		-- "icon.default_text_color",
		-- "icon.default_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text_count.default_text_color",
		-- "text_count.default_color",
	friends_online = {
		style_ids = {
			"icon.text_color",
			"text.text_color",
			"text_count.text_color",
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: strike_team
	-- Other style keys:
			-- "icon.default_text_color",
			-- "icon.default_color",
			-- "icon.disabled_text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_text_color",
			-- "text_count.default_text_color",
			-- "text_count.default_color",
			-- "text_count.disabled_text_color",
	strike_team = {
		style_ids = {
			"icon.text_color",
			"text.text_color",
			"text_count.text_color",
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},


-- TEXTURES --
	-- Widget: wallet_element_background
	-- Other style keys:
		-- "style_id_2.text_color",
		-- "style_id_2.default_text_color",
		-- "style_id_2.default_color",
		-- "style_id_2.disabled_text_color",
	wallet_element_background = {
		style_ids = {
			"background.color",
			"top_divider.color",
			"bottom_divider.color",
		},
		default_color = "black",
		supports_alpha = true,
		mapping = {
			["background.color"] = {
				color_id = "wallet_element_background_color",
				alpha_id = "wallet_element_background_alpha",
				default_color = "black",
				default_alpha = 100
			},
			["top_divider.color"] = {
				color_id = "wallet_element_background_top_divider_color",
				alpha_id = "wallet_element_background_top_divider_alpha",
				default_color = "white",
				default_alpha = 0
			},
			["bottom_divider.color"] = {
				color_id = "wallet_element_background_bottom_divider_color",
				alpha_id = "wallet_element_background_bottom_divider_alpha",
				default_color = "white",
				default_alpha = 0
			},
		},
		supports_alpha = true,
		default_alpha = 255,
	},
	-- Widget: background_left
	background_left = {									-- Background smoke on the left
		style_ids = { "style_id_1.color" },
		default_color = "black",
		supports_alpha = true,
		default_alpha = 11,
	},
	-- Widget: metal_corners
	-- Other style keys:
	metal_corners = {
		style_ids = {
			"style_id_1.color",
			"style_id_2.color",
			"style_id_3.color",
			"style_id_4.color",
		},
		default_color = "white",
		supports_alpha = true,
		default_alpha = 0,
	},
	-- Widget: overlay -- ???
	-- Other style keys:
	-- overlay = {
		-- style_ids = {
			-- "style_id_1.color",
			-- "style_id_2.text_color",
			-- "style_id_2.default_text_color",
			-- "style_id_2.default_color",
			-- "style_id_2.disabled_color",
			-- "style_id_2.disabled_text_color",
			-- "style_id_2.hover_color",
		-- },
		-- default_color = "terminal_grid_background",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },



-- !!! PSYCH WARD MOD !!! --
	-- Widget: cosmetics_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	cosmetics_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "cosmetics_button_background_color",
				alpha_id = "cosmetics_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "cosmetics_button_background_gradient_color",
				alpha_id = "cosmetics_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "cosmetics_button_outer_shadow_color",
				alpha_id = "cosmetics_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: penance_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	penance_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "penance_button_background_color",
				alpha_id = "penance_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "penance_button_background_gradient_color",
				alpha_id = "penance_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "penance_button_outer_shadow_color",
				alpha_id = "penance_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: contracts_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	contracts_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "contracts_button_background_color",
				alpha_id = "contracts_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "contracts_button_background_gradient_color",
				alpha_id = "contracts_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "contracts_button_outer_shadow_color",
				alpha_id = "contracts_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: horde_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	horde_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "horde_button_background_color",
				alpha_id = "horde_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "horde_button_background_gradient_color",
				alpha_id = "horde_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "horde_button_outer_shadow_color",
				alpha_id = "horde_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: mission_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	mission_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "mission_button_background_color",
				alpha_id = "mission_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "mission_button_background_gradient_color",
				alpha_id = "mission_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "mission_button_outer_shadow_color",
				alpha_id = "mission_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: expedition_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	expedition_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "expedition_button_background_color",
				alpha_id = "expedition_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "expedition_button_background_gradient_color",
				alpha_id = "expedition_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "expedition_button_outer_shadow_color",
				alpha_id = "expedition_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: meatgrinder_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	meatgrinder_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "meatgrinder_button_background_color",
				alpha_id = "meatgrinder_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "meatgrinder_button_background_gradient_color",
				alpha_id = "meatgrinder_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "meatgrinder_button_outer_shadow_color",
				alpha_id = "meatgrinder_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: inventory_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	inventory_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "inventory_button_background_color",
				alpha_id = "inventory_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "inventory_button_background_gradient_color",
				alpha_id = "inventory_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "inventory_button_outer_shadow_color",
				alpha_id = "inventory_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: crafting_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	crafting_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "crafting_button_background_color",
				alpha_id = "crafting_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "crafting_button_background_gradient_color",
				alpha_id = "crafting_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "crafting_button_outer_shadow_color",
				alpha_id = "crafting_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: vendor_button
	-- Other style keys:
			-- "background.color",
			-- "background.selected_color",
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "frame.color",
			-- "frame.default_color",
			-- "frame.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	vendor_button = {
		style_ids = {
			"background_gradient.color",
			"outer_shadow.color",
			"background.default_color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "vendor_button_background_color",
				alpha_id = "vendor_button_background_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.color"] = {
				color_id = "vendor_button_background_gradient_color",
				alpha_id = "vendor_button_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "vendor_button_outer_shadow_color",
				alpha_id = "vendor_button_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: difficulty_stepper
	-- Other style keys:
		-- "danger.color",
		-- "style_id_4.default_color",
		-- "style_id_5.default_color",
		-- "style_id_4.default_text_color",
		-- "style_id_5.default_text_color",
		-- "style_id_4.disabled_text_color",
		-- "style_id_5.disabled_text_color",
		-- "style_id_19.disabled_text_color",
		-- "style_id_4.text_color",
		-- "style_id_5.text_color",
	difficulty_stepper = {
		description = "Difficulty stepper",
		style_ids = {
			"difficulty_bar_1.color",
			"difficulty_bar_2.color",
			"difficulty_bar_3.color",
			"difficulty_bar_4.color",
			"difficulty_bar_5.color",
			"stepper_right.color",
			"stepper_left.color",
			"style_id_19.text_color",
			"style_id_19.default_text_color",
			"style_id_19.default_color",
		},
		default_color = "white",
		supports_alpha = true,
		default_alpha = 255,
	},

-- CHARACTER SLOTS -- ЯЧЕЙКИ ПЕРСОНАЖЕЙ
	-- Widget: difficulty_stepper
	-- Other style keys:
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
	character_slot_1 = {				
		description = "Character slot 1",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_1_archetype_icon_selected_color",
				alpha_id = "character_slot_1_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_1_archetype_icon_hover_color",
				alpha_id = "character_slot_1_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_1_background_color",
				alpha_id = "character_slot_1_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_1_background_gradient_hover_color",
				alpha_id = "character_slot_1_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_1_background_gradient_selected_color",
				alpha_id = "character_slot_1_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_1_character_archetype_title_default_color",
				alpha_id = "character_slot_1_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_1_character_archetype_title_hover_color",
				alpha_id = "character_slot_1_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_1_character_insignia_color",
				alpha_id = "character_slot_1_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_1_character_name_default_color",
				alpha_id = "character_slot_1_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_1_character_name_hover_color",
				alpha_id = "character_slot_1_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_1_character_portrait_color",
				alpha_id = "character_slot_1_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_1_contracts_text_default_color",
							alpha_id = "character_slot_1_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_1_contracts_text_hover_color",
							alpha_id = "character_slot_1_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_1_corner_hover_color",
				alpha_id = "character_slot_1_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_1_corner_selected_color",
				alpha_id = "character_slot_1_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_1_frame_hover_color",
				alpha_id = "character_slot_1_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_1_frame_selected_color",
				alpha_id = "character_slot_1_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_1_style_id_7_color",
				alpha_id = "character_slot_1_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_1_style_id_8_color",
				alpha_id = "character_slot_1_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_1_style_id_13_default_color",
				alpha_id = "character_slot_1_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_1_style_id_13_hover_color",
				alpha_id = "character_slot_1_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_2 = {
		description = "Character slot 2",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_2_archetype_icon_selected_color",
				alpha_id = "character_slot_2_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_2_archetype_icon_hover_color",
				alpha_id = "character_slot_2_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_2_background_color",
				alpha_id = "character_slot_2_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_2_background_gradient_hover_color",
				alpha_id = "character_slot_2_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_2_background_gradient_selected_color",
				alpha_id = "character_slot_2_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_2_character_archetype_title_default_color",
				alpha_id = "character_slot_2_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_2_character_archetype_title_hover_color",
				alpha_id = "character_slot_2_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_2_character_insignia_color",
				alpha_id = "character_slot_2_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_2_character_name_default_color",
				alpha_id = "character_slot_2_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_2_character_name_hover_color",
				alpha_id = "character_slot_2_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_2_character_portrait_color",
				alpha_id = "character_slot_2_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_2_contracts_text_default_color",
							alpha_id = "character_slot_2_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_2_contracts_text_hover_color",
							alpha_id = "character_slot_2_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_2_corner_hover_color",
				alpha_id = "character_slot_2_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_2_corner_selected_color",
				alpha_id = "character_slot_2_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_2_frame_hover_color",
				alpha_id = "character_slot_2_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_2_frame_selected_color",
				alpha_id = "character_slot_2_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_2_style_id_7_color",
				alpha_id = "character_slot_2_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_2_style_id_8_color",
				alpha_id = "character_slot_2_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_2_style_id_13_default_color",
				alpha_id = "character_slot_2_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_2_style_id_13_hover_color",
				alpha_id = "character_slot_2_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_3 = {
		description = "Character slot 3",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_3_archetype_icon_selected_color",
				alpha_id = "character_slot_3_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_3_archetype_icon_hover_color",
				alpha_id = "character_slot_3_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_3_background_color",
				alpha_id = "character_slot_3_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_3_background_gradient_hover_color",
				alpha_id = "character_slot_3_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_3_background_gradient_selected_color",
				alpha_id = "character_slot_3_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_3_character_archetype_title_default_color",
				alpha_id = "character_slot_3_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_3_character_archetype_title_hover_color",
				alpha_id = "character_slot_3_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_3_character_insignia_color",
				alpha_id = "character_slot_3_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_3_character_name_default_color",
				alpha_id = "character_slot_3_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_3_character_name_hover_color",
				alpha_id = "character_slot_3_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_3_character_portrait_color",
				alpha_id = "character_slot_3_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_3_contracts_text_default_color",
							alpha_id = "character_slot_3_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_3_contracts_text_hover_color",
							alpha_id = "character_slot_3_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_3_corner_hover_color",
				alpha_id = "character_slot_3_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_3_corner_selected_color",
				alpha_id = "character_slot_3_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_3_frame_hover_color",
				alpha_id = "character_slot_3_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_3_frame_selected_color",
				alpha_id = "character_slot_3_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_3_style_id_7_color",
				alpha_id = "character_slot_3_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_3_style_id_8_color",
				alpha_id = "character_slot_3_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_3_style_id_13_default_color",
				alpha_id = "character_slot_3_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_3_style_id_13_hover_color",
				alpha_id = "character_slot_3_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_4 = {
		description = "Character slot 4",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_4_archetype_icon_selected_color",
				alpha_id = "character_slot_4_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_4_archetype_icon_hover_color",
				alpha_id = "character_slot_4_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_4_background_color",
				alpha_id = "character_slot_4_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_4_background_gradient_hover_color",
				alpha_id = "character_slot_4_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_4_background_gradient_selected_color",
				alpha_id = "character_slot_4_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_4_character_archetype_title_default_color",
				alpha_id = "character_slot_4_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_4_character_archetype_title_hover_color",
				alpha_id = "character_slot_4_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_4_character_insignia_color",
				alpha_id = "character_slot_4_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_4_character_name_default_color",
				alpha_id = "character_slot_4_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_4_character_name_hover_color",
				alpha_id = "character_slot_4_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_4_character_portrait_color",
				alpha_id = "character_slot_4_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_4_contracts_text_default_color",
							alpha_id = "character_slot_4_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_4_contracts_text_hover_color",
							alpha_id = "character_slot_4_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_4_corner_hover_color",
				alpha_id = "character_slot_4_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_4_corner_selected_color",
				alpha_id = "character_slot_4_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_4_frame_hover_color",
				alpha_id = "character_slot_4_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_4_frame_selected_color",
				alpha_id = "character_slot_4_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_4_style_id_7_color",
				alpha_id = "character_slot_4_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_4_style_id_8_color",
				alpha_id = "character_slot_4_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_4_style_id_13_default_color",
				alpha_id = "character_slot_4_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_4_style_id_13_hover_color",
				alpha_id = "character_slot_4_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_5 = {
		description = "Character slot 5",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_5_archetype_icon_selected_color",
				alpha_id = "character_slot_5_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_5_archetype_icon_hover_color",
				alpha_id = "character_slot_5_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_5_background_color",
				alpha_id = "character_slot_5_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_5_background_gradient_hover_color",
				alpha_id = "character_slot_5_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_5_background_gradient_selected_color",
				alpha_id = "character_slot_5_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_5_character_archetype_title_default_color",
				alpha_id = "character_slot_5_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_5_character_archetype_title_hover_color",
				alpha_id = "character_slot_5_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_5_character_insignia_color",
				alpha_id = "character_slot_5_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_5_character_name_default_color",
				alpha_id = "character_slot_5_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_5_character_name_hover_color",
				alpha_id = "character_slot_5_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_5_character_portrait_color",
				alpha_id = "character_slot_5_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_5_contracts_text_default_color",
							alpha_id = "character_slot_5_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_5_contracts_text_hover_color",
							alpha_id = "character_slot_5_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_5_corner_hover_color",
				alpha_id = "character_slot_5_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_5_corner_selected_color",
				alpha_id = "character_slot_5_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_5_frame_hover_color",
				alpha_id = "character_slot_5_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_5_frame_selected_color",
				alpha_id = "character_slot_5_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_5_style_id_7_color",
				alpha_id = "character_slot_5_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_5_style_id_8_color",
				alpha_id = "character_slot_5_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_5_style_id_13_default_color",
				alpha_id = "character_slot_5_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_5_style_id_13_hover_color",
				alpha_id = "character_slot_5_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_6 = {
		description = "Character slot 6",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_6_archetype_icon_selected_color",
				alpha_id = "character_slot_6_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_6_archetype_icon_hover_color",
				alpha_id = "character_slot_6_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_6_background_color",
				alpha_id = "character_slot_6_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_6_background_gradient_hover_color",
				alpha_id = "character_slot_6_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_6_background_gradient_selected_color",
				alpha_id = "character_slot_6_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_6_character_archetype_title_default_color",
				alpha_id = "character_slot_6_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_6_character_archetype_title_hover_color",
				alpha_id = "character_slot_6_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_6_character_insignia_color",
				alpha_id = "character_slot_6_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_6_character_name_default_color",
				alpha_id = "character_slot_6_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_6_character_name_hover_color",
				alpha_id = "character_slot_6_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_6_character_portrait_color",
				alpha_id = "character_slot_6_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_6_contracts_text_default_color",
							alpha_id = "character_slot_6_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_6_contracts_text_hover_color",
							alpha_id = "character_slot_6_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_6_corner_hover_color",
				alpha_id = "character_slot_6_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_6_corner_selected_color",
				alpha_id = "character_slot_6_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_6_frame_hover_color",
				alpha_id = "character_slot_6_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_6_frame_selected_color",
				alpha_id = "character_slot_6_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_6_style_id_7_color",
				alpha_id = "character_slot_6_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_6_style_id_8_color",
				alpha_id = "character_slot_6_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_6_style_id_13_default_color",
				alpha_id = "character_slot_6_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_6_style_id_13_hover_color",
				alpha_id = "character_slot_6_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_7 = {
		description = "Character slot 7",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_7_archetype_icon_selected_color",
				alpha_id = "character_slot_7_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_7_archetype_icon_hover_color",
				alpha_id = "character_slot_7_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_7_background_color",
				alpha_id = "character_slot_7_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_7_background_gradient_hover_color",
				alpha_id = "character_slot_7_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_7_background_gradient_selected_color",
				alpha_id = "character_slot_7_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_7_character_archetype_title_default_color",
				alpha_id = "character_slot_7_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_7_character_archetype_title_hover_color",
				alpha_id = "character_slot_7_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_7_character_insignia_color",
				alpha_id = "character_slot_7_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_7_character_name_default_color",
				alpha_id = "character_slot_7_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_7_character_name_hover_color",
				alpha_id = "character_slot_7_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_7_character_portrait_color",
				alpha_id = "character_slot_7_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_7_contracts_text_default_color",
							alpha_id = "character_slot_7_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_7_contracts_text_hover_color",
							alpha_id = "character_slot_7_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_7_corner_hover_color",
				alpha_id = "character_slot_7_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_7_corner_selected_color",
				alpha_id = "character_slot_7_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_7_frame_hover_color",
				alpha_id = "character_slot_7_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_7_frame_selected_color",
				alpha_id = "character_slot_7_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_7_style_id_7_color",
				alpha_id = "character_slot_7_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_7_style_id_8_color",
				alpha_id = "character_slot_7_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_7_style_id_13_default_color",
				alpha_id = "character_slot_7_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_7_style_id_13_hover_color",
				alpha_id = "character_slot_7_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_8 = {
		description = "Character slot 8",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_8_archetype_icon_selected_color",
				alpha_id = "character_slot_8_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_8_archetype_icon_hover_color",
				alpha_id = "character_slot_8_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_8_background_color",
				alpha_id = "character_slot_8_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_8_background_gradient_hover_color",
				alpha_id = "character_slot_8_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_8_background_gradient_selected_color",
				alpha_id = "character_slot_8_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_8_character_archetype_title_default_color",
				alpha_id = "character_slot_8_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_8_character_archetype_title_hover_color",
				alpha_id = "character_slot_8_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_8_character_insignia_color",
				alpha_id = "character_slot_8_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_8_character_name_default_color",
				alpha_id = "character_slot_8_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_8_character_name_hover_color",
				alpha_id = "character_slot_8_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_8_character_portrait_color",
				alpha_id = "character_slot_8_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_8_contracts_text_default_color",
							alpha_id = "character_slot_8_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_8_contracts_text_hover_color",
							alpha_id = "character_slot_8_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_8_corner_hover_color",
				alpha_id = "character_slot_8_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_8_corner_selected_color",
				alpha_id = "character_slot_8_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_8_frame_hover_color",
				alpha_id = "character_slot_8_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_8_frame_selected_color",
				alpha_id = "character_slot_8_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_8_style_id_7_color",
				alpha_id = "character_slot_8_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_8_style_id_8_color",
				alpha_id = "character_slot_8_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_8_style_id_13_default_color",
				alpha_id = "character_slot_8_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_8_style_id_13_hover_color",
				alpha_id = "character_slot_8_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	character_slot_9 = {
		description = "Character slot 9",
		style_ids = {
			"archetype_icon.selected_color",			-- Знак класса на фоне.
			"archetype_icon.hover_color",				-- Знак класса на фоне при наведении.
			"background.color",							-- Фон.
			"background_gradient.hover_color",			-- Градиент фона при наведении.
			"background_gradient.selected_color",		-- Градиент фона при выборе.
			"character_archetype_title.default_color",	-- Название класса.
			"character_archetype_title.hover_color",	-- Название класса при наведении.
			"character_insignia.color",					-- Медаль
			"character_name.default_color",				-- Имя
			"character_name.hover_color",				-- Имя при наведении
			"character_portrait.color",					-- Портрет
			"contracts_text.default_color",				-- Контракты. BetterMelk!
			"contracts_text.hover_color",				-- Контракты при наведении. BetterMelk!
			"corner.hover_color",						-- Углы при наведении.
			"corner.selected_color",					-- Углы при выборе.
			"frame.hover_color",						-- Граница при наведении.
			"frame.selected_color",						-- Граница при выборе.
			"style_id_7.color",							-- Нижний разделитель.
			"style_id_8.color",							-- Верхний разделитель.
			"style_id_13.default_color",				-- Звание. Меняется прозрачность.
			"style_id_13.hover_color",					-- Звание при наведении. Меняется прозрачность.
		-- Не работают?
		-- "archetype_icon.default_color",
		-- "archetype_icon.color",
		-- "background_gradient.color",
		-- "character_archetype_title.default_text_color",
		-- "character_archetype_title.text_color",
		-- "character_name.text_color",
		-- "character_name.default_text_color",
		-- "contracts_text.default_text_color",
		-- "contracts_text.text_color",
		-- "corner.default_color",
		-- "corner.color",
		-- "frame.default_color",
		-- "frame.color",
		-- "style_id_13.default_text_color",
		-- "style_id_13.text_color",
		},
		supports_alpha = true,
		mapping = {
			["archetype_icon.selected_color"] = {
				color_id = "character_slot_9_archetype_icon_selected_color",
				alpha_id = "character_slot_9_archetype_icon_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["archetype_icon.hover_color"] = {
				color_id = "character_slot_9_archetype_icon_hover_color",
				alpha_id = "character_slot_9_archetype_icon_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background.color"] = {
				color_id = "character_slot_9_background_color",
				alpha_id = "character_slot_9_background_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.hover_color"] = {
				color_id = "character_slot_9_background_gradient_hover_color",
				alpha_id = "character_slot_9_background_gradient_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["background_gradient.selected_color"] = {
				color_id = "character_slot_9_background_gradient_selected_color",
				alpha_id = "character_slot_9_background_gradient_selected_alpha",
				default_color = "olive_drab",
				default_alpha = 255
			},
			["character_archetype_title.default_color"] = {
				color_id = "character_slot_9_character_archetype_title_default_color",
				alpha_id = "character_slot_9_character_archetype_title_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_archetype_title.hover_color"] = {
				color_id = "character_slot_9_character_archetype_title_hover_color",
				alpha_id = "character_slot_9_character_archetype_title_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_insignia.color"] = {
				color_id = "character_slot_9_character_insignia_color",
				alpha_id = "character_slot_9_character_insignia_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.default_color"] = {
				color_id = "character_slot_9_character_name_default_color",
				alpha_id = "character_slot_9_character_name_default_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["character_name.hover_color"] = {
				color_id = "character_slot_9_character_name_hover_color",
				alpha_id = "character_slot_9_character_name_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["character_portrait.color"] = {
				color_id = "character_slot_9_character_portrait_color",
				alpha_id = "character_slot_9_character_portrait_alpha",
				default_color = "white",
				default_alpha = 255
			},
						["contracts_text.default_color"] = {							--! BETTER MELK
							color_id = "character_slot_9_contracts_text_default_color",
							alpha_id = "character_slot_9_contracts_text_default_alpha",
							default_color = "online_green",
							default_alpha = 255
						},
						["contracts_text.hover_color"] = {								--! BETTER MELK
							color_id = "character_slot_9_contracts_text_hover_color",
							alpha_id = "character_slot_9_contracts_text_hover_alpha",
							default_color = "white",
							default_alpha = 255
						},
			["corner.hover_color"] = {
				color_id = "character_slot_9_corner_hover_color",
				alpha_id = "character_slot_9_corner_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["corner.selected_color"] = {
				color_id = "character_slot_9_corner_selected_color",
				alpha_id = "character_slot_9_corner_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.hover_color"] = {
				color_id = "character_slot_9_frame_hover_color",
				alpha_id = "character_slot_9_frame_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["frame.selected_color"] = {
				color_id = "character_slot_9_frame_selected_color",
				alpha_id = "character_slot_9_frame_selected_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_7.color"] = {
				color_id = "character_slot_9_style_id_7_color",
				alpha_id = "character_slot_9_style_id_7_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_8.color"] = {
				color_id = "character_slot_9_style_id_8_color",
				alpha_id = "character_slot_9_style_id_8_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.default_color"] = {
				color_id = "character_slot_9_style_id_13_default_color",
				alpha_id = "character_slot_9_style_id_13_default_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["style_id_13.hover_color"] = {
				color_id = "character_slot_9_style_id_13_hover_color",
				alpha_id = "character_slot_9_style_id_13_hover_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},

}

return {
	menu_name = menu_name,
	VIEW_NAME = VIEW_NAME,
	WIDGETS = WIDGETS,
	WIDGET_ORDER = WIDGET_ORDER,
}