-- Views/CUIC_CraftingView.lua
local mod = get_mod("CustomUIColors")

local menu_name = "crafting_menu"
local VIEW_NAME = "CraftingView"

-- Порядок виджетов
local WIDGET_ORDER = {
	-- Divider -- Разделитель
	"button_divider",

	-- Corner Textures -- Текстуры углов
	"corner_top_left",
	"corner_top_right",
	"corner_top_right_no_wallet",
	"corner_bottom_left",
	"corner_bottom_right",
	"option_button_1",
	"option_button_2",
	"overlay",

}


local WIDGETS = {
-- DIVIDER -- РАЗДЕЛИТЕЛЬ
	button_divider = {
		style_ids = { "style_id_1.color", },
		default_color = "online_green",
		supports_alpha = true,
		default_alpha = 255,
	},
	-- canvas_overlay = {	-- ???
		-- style_ids = { "style_id_1.color", },
		-- default_color = "white",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },

-- CORNER TEXTURES -- ТЕКСТУРЫ УГЛОВ
	corner_top_right_no_wallet = {
		description = "Corner top right no wallet",
		style_ids = {
			"style_id_1.color",
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {						-- Рамка слева вверху без кошеля
				color_id = "corner_top_right_no_wallet_s1_color",
				alpha_id = "corner_top_right_no_wallet_s1_alpha",
				default_color = "white",
				default_alpha = 255
			},
		},
	},
	corner_top_left = {											-- CORNER TOP RIGHT
		style_ids = {
			"style_id_1.color",
			"style_id_2.color",
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {						-- Рамка слева вверху
				color_id = "corner_top_left_s1_color",
				alpha_id = "corner_top_left_s1_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["style_id_2.color"] = {						-- Пламя свечей
				color_id = "corner_top_left_s2_color",
				alpha_id = "corner_top_left_s2_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	corner_top_right = {										-- CORNER TOP LEFT
		style_ids = {
			"style_id_1.color",
			"style_id_2.color",
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {						-- Рамка справа вверху
				color_id = "corner_top_right_s1_color",
				alpha_id = "corner_top_right_s1_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["style_id_2.color"] = {						-- Пламя свечей
				color_id = "corner_top_right_s2_color",
				alpha_id = "corner_top_right_s2_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	corner_bottom_left = {
		style_ids = {
			"style_id_1.color",
			"style_id_2.color",
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {						-- Рамка слева внизу
				color_id = "corner_bottom_left_s1_color",
				alpha_id = "corner_bottom_left_s1_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["style_id_2.color"] = {						-- Пламя свечей
				color_id = "corner_bottom_left_s2_color",
				alpha_id = "corner_bottom_left_s2_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},
	corner_bottom_right = {
		style_ids = {
			"style_id_1.color",
			"style_id_2.color",
		},
		supports_alpha = true,
		mapping = {
			["style_id_1.color"] = {						-- Рамка справа внизу
				color_id = "corner_bottom_right_s1_color",
				alpha_id = "corner_bottom_right_s1_alpha",
				default_color = "white",
				default_alpha = 255
			},
			["style_id_2.color"] = {						-- Пламя свечей
				color_id = "corner_bottom_right_s2_color",
				alpha_id = "corner_bottom_right_s2_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
		},
	},

-- TEXT -- ТЕКСТ
	-- title_text = {
		-- style_ids = {
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_text_color",
		-- },
		-- default_color = "white",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },
	-- description_text = {
		-- style_ids = {
			-- "text.text_color",
			-- "text.default_text_color",
			-- "text.default_color",
			-- "text.disabled_text_color",
		-- },
		-- default_color = "online_green",
		-- supports_alpha = true,
		-- default_alpha = 255,
	-- },


-- BUTTONS --
	-- Widget: option_button_1
	-- Other style keys:
		-- "arrow_highlight.color",
		-- "arrow_highlight.default_color",
		-- "arrow_highlight.disabled_color",
		-- "arrow_highlight.hover_color",
		-- "background.color",
		-- "background.selected_color",
		-- "background_gradient.color",
		-- "background_gradient.disabled_color",
		-- "background_gradient.selected_color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.hover_color",
		-- "corner.selected_color",
		-- "frame.color",
		-- "frame.default_color",
		-- "frame.hover_color",
		-- "frame.selected_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
		-- "text.selected_color",
		-- "text.text_color",
	option_button_1 = {
		style_ids = {
			"background.default_color",
			"background_gradient.default_color",
			"outer_shadow.color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "option_button_1_background_default_color",
				alpha_id = "option_button_1_background_default_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.default_color"] = {
				color_id = "option_button_1_background_gradient_color",
				alpha_id = "option_button_1_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "option_button_1_outer_shadow_color",
				alpha_id = "option_button_1_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: option_button_2
	-- Other style keys:
		-- "arrow_highlight.color",
		-- "arrow_highlight.default_color",
		-- "arrow_highlight.disabled_color",
		-- "arrow_highlight.hover_color",
		-- "background.color",
		-- "background.selected_color",
		-- "background_gradient.color",
		-- "background_gradient.disabled_color",
		-- "background_gradient.selected_color",
		-- "corner.color",
		-- "corner.default_color",
		-- "corner.hover_color",
		-- "corner.selected_color",
		-- "frame.color",
		-- "frame.default_color",
		-- "frame.hover_color",
		-- "frame.selected_color",
		-- "text.default_text_color",
		-- "text.default_color",
		-- "text.disabled_color",
		-- "text.disabled_text_color",
		-- "text.hover_color",
		-- "text.selected_color",
		-- "text.text_color",
	option_button_2 = {
		style_ids = {
			"background.default_color",
			"background_gradient.default_color",
			"outer_shadow.color",
		},
		supports_alpha = true,
		mapping = {
			["background.default_color"] = {
				color_id = "option_button_2_background_default_color",
				alpha_id = "option_button_2_background_default_alpha",
				default_color = "black",
				default_alpha = 155
			},
			["background_gradient.default_color"] = {
				color_id = "option_button_2_background_gradient_color",
				alpha_id = "option_button_2_background_gradient_alpha",
				default_color = "online_green",
				default_alpha = 255
			},
			["outer_shadow.color"] = {
				color_id = "option_button_2_outer_shadow_color",
				alpha_id = "option_button_2_outer_shadow_alpha",
				default_color = "black",
				default_alpha = 255
			},
		},
	},
	-- Widget: overlay
	overlay = {
		style_ids = { "overlay.color", },
		default_color = "black",
		supports_alpha = true,
		default_alpha = 0,
	},
}

return {
	menu_name = menu_name,
	VIEW_NAME = VIEW_NAME,
	WIDGETS = WIDGETS,
	WIDGET_ORDER = WIDGET_ORDER,
}