event_inherited(); // Draw the window frame

// Draw the terminal content to the surface
surface_set_target(terminal_surface);
draw_clear_alpha(c_black, 1);

var displayText = outputBuffer;
if (bootComplete) {
    displayText = outputBuffer + inputBuffer;
    if (cursorBlink) {
        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
    }
}

draw_set_color(c_white);
draw_set_font(font);
draw_text_ext(10, 10 - scroll_position, displayText, -1, window_width - scrollbar_width - 20);

surface_reset_target();

// Draw the surface to the window
draw_surface(terminal_surface, x, y + window_header_height);

// Draw the scrollbar (see Step 2)