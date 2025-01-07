event_inherited()


// Draw the resize handle
draw_set_color(c_blue);
draw_rectangle(window_x + window_width - 10, window_y + window_height - 10, window_x + window_width, window_y + window_height, false);

// Draw the terminal background
draw_set_color(c_black);
draw_rectangle(terminal_x, terminal_y, terminal_x + terminal_width, terminal_y + terminal_height, false);

// Draw the terminal content
draw_set_color(c_lime);
var displayText = "Terminal content goes here..."; // Replace with your terminal output
draw_text_ext(terminal_x + 10, terminal_y + 10 - scroll_position, displayText, -1, terminal_width - 20);

// Draw the scrollbar (if needed)
if (scrollbar_visible) {
    draw_set_color(c_gray);
    draw_rectangle(terminal_x + terminal_width - scrollbar_width, terminal_y, terminal_x + terminal_width, terminal_y + terminal_height, false);
}
// Calculate total height of the terminal content
var total_height = string_height_ext(displayText, -1, terminal_width - 20);

// Show scrollbar if content is taller than the terminal
scrollbar_visible = total_height > terminal_height;

if (scrollbar_visible) {
    // Calculate scrollbar position and height
    var scrollbar_height = (terminal_height / total_height) * terminal_height;
    var scrollbar_y = (scroll_position / (total_height - terminal_height)) * (terminal_height - scrollbar_height);

    // Draw the scrollbar
    draw_set_color(c_gray);
    draw_rectangle(terminal_x + terminal_width - scrollbar_width, terminal_y + scrollbar_y, terminal_x + terminal_width, terminal_y + scrollbar_y + scrollbar_height, false);
}