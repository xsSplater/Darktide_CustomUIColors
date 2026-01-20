-- Views/CUIC_MainMenuView.lua
local mod = get_mod("CustomUIColors")

local menu_name = "main_menu"
local VIEW_NAME = "MainMenuView"

local WIDGETS = {
-- CHARACTER LIST --
-- Widget: character_list_background
	character_list_background = {
		description = "Character list background",
		style_ids = {
			"background.color", -- Цвет фона
		-- "style_id_2.color",  -- Рамка сверху
		-- "style_id_3.color",  -- Рамка снизу
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: character_grid_mask
	character_grid_mask = {
		description = "Character grid mask",
		style_ids = { "style_id_1.color", },
		default_color = "white",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: character_grid_scrollbar
	character_grid_scrollbar = {
		description = "Character grid scrollbar",
		style_ids = {
			"thumb.idle_color",		  -- Цвет ползунка, без highlight_color меняет цвет при движении
			"thumb.highlight_color",  -- Подсветка при наведении, без idle_color меняет цвет при движении
			"track_frame.color",	  -- Цвет рамки
		-- "track_background.color",  -- Цвет фона
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},


-- CHARACTER INFO --
-- Widget: character_info
	character_info = {
		description = "Character info",
		style_ids = {
			"style_id_1.color",			 -- Большой знак класса
			"text_archetype.text_color", -- Значок малый и название класса
			"text_character.text_color", -- Имя персонажа
		},
		default_color = "white",
		supports_alpha = true,
		default_alpha = 255,
	},


-- CHARACTER SLOTS --
-- Widget: character_slot_1
	-- Other style keys:
		-- "archetype_icon.color",			 -- Цвет значка класса. Не меняется и обесцвечивает границы.
		-- "background.color",				 -- Цвет фона. При наведении сбрасывает цвет границ.
		-- "background_gradient.color",		 -- Цвет фона градиент. При наведении сбрасывает цвет границ.
		-- "character_archetype_title.text_color", -- Цвет названия класса. Обесцвечивает границы!
		-- "character_insignia.color",		 -- Цвет медали (Цветная. Не красим! Но можно скрыть.)
		-- "character_name.default_color",	 -- Цвет имени
		-- "character_name.hover_color",	 -- Цвет имени при наведении
		-- "character_name.text_color",		 -- Цвет имени. Портит границы!
		-- "character_portrait.color",		 -- Цвет портрета и рамки
		-- "contracts_text.hover_color",	 -- Цвет контрактов при наведении. Мод BetterMelk!
		-- "contracts_text.text_color",		 -- Цвет контрактов при наведении. Мод BetterMelk! Не красит!
		-- "corner.color",					 -- Цвет углов. При наведении сбрасывает цвет.
		-- "corner.hover_color",			 -- Цвет углов при наведении. Нет разницы.
		-- "corner.selected_color",			 -- Цвет углов при выборе. Нет разницы.
		-- "frame.color",					 -- Цвет рамки. При наведении сбрасывает цвет default_color.
		-- "frame.selected_color",			 -- Цвет выделения по границе. Почти незаметно.
	character_slot_1 = {
		description = "Character slot 1",
		style_ids = {
			"style_id_7.color",					 -- Цвет нижней границы.
			"style_id_8.color",					 -- Цвет верхней границы.
			"frame.default_color",				 -- Цвет рамки по умолчанию. Границам не даёт исчезать.
			"frame.hover_color",				 -- Цвет границы при наведении.
			"archetype_icon.selected_color",	 -- Цвет знака класса на фоне.
			"archetype_icon.hover_color",		 -- Цвет знака класса на фоне при наведении.
			"contracts_text.default_color",		 -- Цвет текста контрактов по умолчанию. Мод BetterMelk!
			"background_gradient.hover_color",	 -- Цвет градиента фона при наведении.
			"background_gradient.selected_color", -- Цвет градиента фона при выборе.
		},
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: character_slot_2
	character_slot_2 = { description = "Character slot 2", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_3
	character_slot_3 = { description = "Character slot 3", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_4
	character_slot_4 = { description = "Character slot 4", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_5
	character_slot_5 = { description = "Character slot 5", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_6
	character_slot_6 = { description = "Character slot 6", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_7
	character_slot_7 = { description = "Character slot 7", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_8
	character_slot_8 = { description = "Character slot 8", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },
-- Widget: character_slot_9
	character_slot_9 = { description = "Character slot 9", style_ids = { "style_id_7.color", "style_id_8.color", "frame.default_color", "frame.hover_color", "archetype_icon.selected_color", "archetype_icon.hover_color", "contracts_text.default_color", "background_gradient.hover_color", "background_gradient.selected_color", }, default_color = "online_green", supports_alpha = true, default_alpha = 255, },


-- BUTTONS --
-- Widget: create_button
	-- Other style keys:
		-- "background.color",
		-- "background_gradient.disabled_color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.disabled_color",
		-- "corner.hover_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.hover_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
	create_button = {
		description = "Create button",
		style_ids = {
			"background.default_color",
			"background_gradient.color",
			"background.selected_color",
			"background_gradient.default_color",
			"background_gradient.selected_color",
			"frame.color",
			"frame.default_color",
			"frame.disabled_color",
			"frame.hover_color",
			"frame.selected_color",
			"outer_shadow.color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: play_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color", -- Углы
		-- "corner.hover_color", -- Углы при наведении
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
		description = "Play button",
		style_ids = {
			"background.color",
			"background_gradient.color",
			"frame.color", -- ???
			"frame.default_color", -- Рамка
			"frame.hover_color", -- Рамка при наведении
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},


-- TEXT --
-- Widget: slots_count
	-- Other style keys:
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_text_color",
	slots_count = {
		description = "Slots count",
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
		description = "Friends online",
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
		description = "Strike team",
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
		-- "top_divider.color",
		-- "bottom_divider.color",
		-- "style_id_2.text_color",
		-- "style_id_2.default_text_color",
		-- "style_id_2.default_color",
		-- "style_id_2.disabled_text_color",
	wallet_element_background = {
		description = "Wallet element background",
		style_ids = {
			"background.color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: background_left
	background_left = {
		description = "Background smoke on the left",
		style_ids = { "style_id_1.color", },
		default_color = "black",
		supports_alpha = true,
		default_alpha = 5,
	},
-- Widget: metal_corners
	-- Other style keys:
	metal_corners = {
		description = "Metal corners",
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
		-- description = "Overlay",
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
			-- "corner.color",
			-- "corner.default_color",
			-- "corner.selected_color",
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_color",
			-- "text.disabled_text_color",
			-- "text.hover_color",
	cosmetics_button = {
		description = "Cosmetics button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: penance_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	penance_button = {
		description = "Penance button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: contracts_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	contracts_button = {
		description = "Contracts button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: horde_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	horde_button = {
		description = "Horde button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: meatgrinder_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	meatgrinder_button = {
		description = "Meat Grinder button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: inventory_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	inventory_button = {
		description = "Inventory button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: crafting_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	crafting_button = {
		description = "Crafting button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: vendor_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	vendor_button = {
		description = "Vendor button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
	},
-- Widget: mission_button
	-- Other style keys:
		-- "background.color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.selected_color",
		-- "text.text_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
	mission_button = {
		description = "Mission button",
		style_ids = {
			"background_gradient.color",
			"frame.color",
			"outer_shadow.color",
			"background.default_color",
			-- "background.selected_color",
			"frame.default_color",
			"frame.selected_color",
		},
		default_color = "black",
		supports_alpha = true,
		default_alpha = 255,
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
}

return {
	menu_name = menu_name,
	VIEW_NAME = VIEW_NAME,
	WIDGETS = WIDGETS
}
