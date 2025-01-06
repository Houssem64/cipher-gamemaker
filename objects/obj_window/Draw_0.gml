// Background
draw_set_color(c_white);
draw_rectangle(x, y, x + width, y + height, false);

// Title bar
draw_set_color(c_gray);
draw_rectangle(x, y, x + width, y + 20, false);

// Title text
draw_set_color(c_black);
draw_text(x + 10, y + 5, window_title);

// Close button
draw_set_color(c_red);
draw_rectangle(x + width - 25, y + 5, x + width - 5, y + 15, false);
draw_set_color(c_white);
draw_text(x + width - 20, y + 5, "X");

// Fullscreen button
draw_set_color(c_green);
draw_rectangle(x + width - 50, y + 5, x + width - 30, y + 15, false);
draw_set_color(c_white);
draw_text(x + width - 45, y + 5, "[]");

// Resize handle
draw_set_color(c_blue);
draw_rectangle(x + width - 10, y + height - 10, x + width, y + height, false);
