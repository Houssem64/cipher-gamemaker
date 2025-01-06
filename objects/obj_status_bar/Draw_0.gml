// Draw Event of obj_status_bar
draw_set_color(color_background);
draw_rectangle(0, 0, room_width, 30, false); // Status bar background

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