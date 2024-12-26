//draw_set_font(font);
//draw_set_color(c_black);
//draw_rectangle(0, 0, room_width, room_height, false);
//draw_set_color(c_lime);
//var displayText = outputBuffer;
//if (bootComplete) {
//    displayText = outputBuffer + inputBuffer;
//    if (cursorBlink) {
//        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
//    }
//}
//draw_text_ext(10, 10, displayText, -1, room_width - 20);
draw_set_font(font);

// Calculate all scrollbar metrics at the start of draw
//var total_height = string_height_ext(outputBuffer + inputBuffer, -1, room_width - 20);
//var content_height = max(total_height, room_height);
//var visible_ratio = min(1, room_height / content_height);
//var scrollbar_height = max(30, room_height * visible_ratio);
//var max_scroll = max(0, total_height - room_height + 20);
//var scrollbar_y = 0;

//if (max_scroll > 0) {
//    scrollbar_y = (scroll_position / max_scroll) * (room_height - scrollbar_height);
//}

// Create a surface using full room width
var surf = surface_create(room_width, room_height);
surface_set_target(surf);

// Clear the surface
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
draw_text_ext(10, 10 - scroll_position, displayText, -1, room_width - 30);

// Reset surface target
surface_reset_target();

// Draw the surface to the screen
draw_surface_part(surf, 0, 0, room_width - scrollbar_width, room_height, 0, 0);

// Clean up
surface_free(surf);

// Draw scrollbar background
draw_set_color(c_dkgray);
draw_rectangle(room_width - scrollbar_width, 0, room_width, room_height, false);

// Draw scrollbar if content exceeds room height
if (total_height > room_height) {
    var scrollbar_color = c_gray;
    if (scrollbar_hover) scrollbar_color = c_silver;
    if (scrollbar_dragging) scrollbar_color = c_white;

    draw_set_color(scrollbar_color);
    draw_rectangle(
        room_width - scrollbar_width + 2,
        scrollbar_y,
        room_width - 2,
        scrollbar_y + scrollbar_height,
        false
    );
}