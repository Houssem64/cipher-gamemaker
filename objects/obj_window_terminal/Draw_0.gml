// Set the custom font
draw_set_font(font);

// Create a surface for the terminal window
var surf = surface_create(window_width, window_height);
surface_set_target(surf);

// Clear the surface with black
draw_clear_alpha(c_black, 1);

// Draw the text to the surface
var displayText = outputBuffer;
if (bootComplete) {
    displayText = outputBuffer + inputBuffer;
    if (cursorBlink) {
        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
    }
}

// Draw the text offset by scroll position
draw_text_ext(10, 10 - scroll_position, displayText, -1, window_width - 30);

// Reset surface target
surface_reset_target();

// Draw the surface to the screen at the window's position
draw_surface(surf, window_x, window_y);

// Clean up
surface_free(surf);

// Draw scrollbar background
draw_set_color(c_dkgray);
draw_rectangle(window_x + window_width - scrollbar_width, window_y, window_x + window_width, window_y + window_height, false);

// Calculate total height of the text content
var total_height = string_height_ext(outputBuffer + inputBuffer, -1, window_width - 30);

if (total_height > window_height) {
    var scrollbar_color = c_gray;
    if (scrollbar_hover) scrollbar_color = c_silver;
    if (scrollbar_dragging) scrollbar_color = c_white;

    // Calculate scrollbar height and position
    var visible_ratio = min(1, window_height / total_height);
    var scrollbar_height = max(30, window_height * visible_ratio);
    var scrollbar_y = (scroll_position / max_scroll) * (window_height - scrollbar_height);
    
    // Ensure scrollbar_y is within bounds
    if (max_scroll == 0) {
        scrollbar_y = 0; // No scrolling needed
    }

    // Draw the scrollbar
    draw_set_color(scrollbar_color);
    draw_rectangle(
        window_x + window_width - scrollbar_width + 2,
        window_y + scrollbar_y,
        window_x + window_width - 2,
        window_y + scrollbar_y + scrollbar_height,
        false
    );
}