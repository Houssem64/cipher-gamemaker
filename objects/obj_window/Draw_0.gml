// Draw the window background
draw_set_color(c_white);
draw_rectangle(x, y, x + width, y + height, false);

// Draw the title bar
draw_set_color(c_gray);
draw_rectangle(x, y, x + width, y + 20, false);

// Draw the title text
draw_set_color(c_black);
draw_text(x + 10, y + 5, window_title); // Use dynamic title

// Draw the close button (red square at the top-right)
draw_set_color(c_red);
draw_rectangle(x + width - 25, y + 5, x + width - 5, y + 15, false);
draw_set_color(c_white);
draw_text(x + width - 20, y + 5, "X");

// Draw the fit-to-screen button (green square next to the close button)
draw_set_color(c_green);
draw_rectangle(x + width - 50, y + 5, x + width - 30, y + 15, false);
draw_set_color(c_white);
draw_text(x + width - 45, y + 5, "[]");

// Draw the resize handle (bottom-right corner)
draw_set_color(c_blue);
draw_rectangle(x + width - 10, y + height - 10, x + width, y + height, false);

// Draw some text inside the window
draw_set_color(c_black);
draw_text(x + 10, y + 30, window_content); // Use dynamic content