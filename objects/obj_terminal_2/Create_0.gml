event_inherited()
// Window properties

width = 800;
height = 500;
min_width = 600;
min_height = 300;
window_title = "Terminal";

// Terminal properties
terminal_x = x;
terminal_y = y + 20; // Offset for title bar
terminal_width = width;
terminal_height = height - 20;

// Scrollbar properties
scroll_position = 0;
scrollbar_width = 10;
scrollbar_visible = false;
total_height = 0;

// Mouse interaction flags
dragging_window = false;
resizing_window = false;
close_button_hover = false;
fullscreen_button_hover = false;
resize_handle_hover = false;

// Mouse offset for dragging
drag_offset_x = 0;
drag_offset_y = 0;
