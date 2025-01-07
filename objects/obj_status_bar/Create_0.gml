// Create Event of obj_status_bar
time = "11:10 PM";
date = "Sat, Oct 14";
cpu_usage = "15%";
memory_usage = "1.19GB / 8.69GB";
network_rx = "147 KiB/s";
network_tx = "15.4 KiB/s";

// Colors
color_background = make_color_rgb(30, 30, 30);
color_text = make_color_rgb(200, 200, 200);
color_highlight = make_color_rgb(0, 150, 255);
color_warning = make_color_rgb(255, 100, 100);

// Icon positions and dimensions
icon_size = 20;
icon_padding = 5;
email_icon_x = room_width/2 - icon_size - icon_padding;
terminal_icon_x = room_width/2 + icon_padding;
file_system_icon_x = room_width/2 + icon_padding + icon_size
icon_y = 5;
