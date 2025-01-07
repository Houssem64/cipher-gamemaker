// Draw Event of obj_status_bar
var default_font = draw_get_font()
draw_set_font(icons);
draw_set_color(color_background);
draw_rectangle(0, 0, room_width, 35, false); // Status bar background

// Draw app icons
// Email icon (simple envelope shape)
draw_set_color(color_text);
draw_rectangle(email_icon_x, icon_y, email_icon_x + icon_size, icon_y + icon_size, true);
draw_line(email_icon_x, icon_y, email_icon_x + icon_size/2, icon_y + icon_size/2);
draw_line(email_icon_x + icon_size, icon_y, email_icon_x + icon_size/2, icon_y + icon_size/2);

//file system icon 
draw_set_color(color_text);
draw_rectangle(file_system_icon_x, icon_y, file_system_icon_x + icon_size, icon_y + icon_size, true);
draw_text(file_system_icon_x+7,icon_y,"_")



// Terminal icon (simple terminal shape)
draw_rectangle(terminal_icon_x, icon_y, terminal_icon_x + icon_size, icon_y + icon_size, true);

draw_text(terminal_icon_x,icon_y,">")
draw_text(terminal_icon_x,icon_y,"_")
draw_set_color(color_text);
draw_set_font(fnt_monospace);

// Draw time and date
draw_text(20, 5, time + " | " + date);

// Draw system stats
var stats = "CPU: " + cpu_usage + " | Mem: " + memory_usage + " | Net: " + network_rx + " / " + network_tx;
draw_text(room_width - string_width(stats) - 20, 5, stats);

// Highlight specific elements
draw_set_color(color_highlight);
draw_text(20, 5, time); // Highlight time
draw_set_color(color_warning);
draw_text(room_width - string_width(stats) - 20, 5, "CPU: " + cpu_usage); // Highlight CPU usage
draw_set_font(default_font)