local nvide = vim.g

if nvide.neovide then
	nvide.neovide_padding_top = 0
	nvide.neovide_padding_bottom = 0
	nvide.neovide_padding_right = 0
	nvide.neovide_padding_left = 0
	--vim.g.neovide_transparency = 0.8
	nvide.neovide_opacity = 0.8
	-- vim.g.neovide_background_color = "#0f1117" .. alpha()
	nvide.neovide_scroll_animation_length = 0.3
	nvide.neovide_position_animation_length = 0.15
	nvide.neovide_cursor_animate_command_line = true
	nvide.neovide_cursor_trail_size = 0.6
	nvide.neovide_cursor_animation_length = 0.12
	nvide.neovide_refresh_rate_idle = 25
	nvide.neovide_refresh_rate = 60
	nvide.neovide_theme = "auto"
	nvide.neovide_hide_mouse_when_typing = false
	nvide.neovide_line_space = 10
	-- nvide.neovide_window_blurred = true
	nvide.neovide_floating_blur_amount_x = 2.0
	nvide.neovide_floating_blur_amount_y = 2.0
	nvide.neovide_floating_shadow = false
	nvide.neovide_floating_z_height = 10
	nvide.neovide_light_angle_degrees = 45
	nvide.neovide_light_radius = 5
	nvide.neovide_cursor_antialiasing = true
	nvide.neovide_underline_automatic_scaling = false
	nvide.neovide_hide_mouse_when_typing = true
	nvide.neovide_refresh_rate = 55
	nvide.neovide_refresh_rate_idle = 35
	nvide.neovide_remember_window_size = true
	nvide.neovide_confirm_quit = false
	vim.o.guifont = "JetBrainsMono_NF:h11:#e-subpixelantialias"
	vim.opt.termguicolors = true
end
