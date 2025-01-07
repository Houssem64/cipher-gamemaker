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
// Inherit the window's draw event


//event_inherited();
//var default_font = draw_get_font();
//var font = font_add("cour.ttf",20, false, false, 32, 128);
//// Set the font for the terminal
//draw_set_font(font);

//// Create a surface for the terminal content
//var surf = surface_create(width, height);
//surface_set_target(surf);

//// Clear the surface with a black background
//draw_clear_alpha(c_black, 1);

//// Prepare the text to display
//var displayText = outputBuffer;
//if (bootComplete) {
//    displayText = outputBuffer + inputBuffer;
//    if (cursorBlink) {
//        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
//    }
//}

//// Draw the text to the surface, offset by the scroll position
//draw_text_ext(10, 10 - scroll_position, displayText, -1, width - 30);

//// Reset the surface target
//surface_reset_target();

//// Draw the surface to the screen, within the window's bounds
//draw_surface_part(surf, 0, 0, width - scrollbar_width, height, x, y);

//// Clean up the surface
//surface_free(surf);

//// Draw the scrollbar background
//draw_set_color(c_dkgray);
//draw_rectangle(x + width - scrollbar_width, y, x + width, y + height, false);

//// Draw the scrollbar if needed
//if (total_height > height) {
//    var scrollbar_color = c_gray;
//    if (scrollbar_hover) scrollbar_color = c_silver;
//    if (scrollbar_dragging) scrollbar_color = c_white;

//    // Calculate scrollbar height and position
//    var visible_ratio = min(1, height / total_height);
//    var scrollbar_height = max(30, height * visible_ratio);
//    var scrollbar_y = (scroll_position / max_scroll) * (height - scrollbar_height);
    
//    // Ensure scrollbar_y is within bounds
//    if (max_scroll == 0) {
//        scrollbar_y = 0; // No scrolling needed
//    }

//    // Draw the scrollbar
//    draw_set_color(scrollbar_color);
//    draw_rectangle(
//        x + width - scrollbar_width + 2,
//        y + scrollbar_y,
//        x + width - 2,
//        y + scrollbar_y + scrollbar_height,
//        false
//    );
//}

//draw_set_font(default_font);


// Inherit the window's draw event
event_inherited();

// Save the default font and text size
var default_font = draw_get_font();


// Set the custom font and text size
var custom_font = font_add("cour.ttf", 20, false, false, 32, 128);
draw_set_font(custom_font);


// Calculate terminal dimensions
var content_start_x = x + 10;
var content_start_y = y + 30;
var content_width = width - 20 - scrollbar_width;
var content_height = height - 40;

var surf = surface_create(content_width, content_height);
surface_set_target(surf);

// Clear the surface
draw_clear_alpha(c_black, 1);

// Draw terminal text on surface
draw_set_color(c_white);
var displayText = outputBuffer;
if (bootComplete) {
    displayText = outputBuffer + inputBuffer;
    if (cursorBlink) {
        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
    }
}
draw_text_ext(0, -scroll_position, displayText, -1, content_width);

// Reset surface target
surface_reset_target();


// Draw the terminal background
draw_set_color(c_black);
draw_rectangle(content_start_x, content_start_y, x + width - 10, y + height - 10, false);

//// Prepare the text to display
//var displayText = outputBuffer;
//if (bootComplete) {
//    displayText = outputBuffer + inputBuffer;
//    if (cursorBlink) {
//        displayText = string_insert("|", displayText, string_length(outputBuffer) + cursorPosition + 1);
//    }
//}

// Draw the text, offset by the scroll position

draw_surface(surf, content_start_x, content_start_y);

// Clean up surface
surface_free(surf);



//draw_set_color(c_white);
//draw_text_ext(content_start_x, content_start_y - scroll_position, displayText, -1, content_width);

// Draw the scrollbar background
draw_set_color(c_dkgray);
draw_rectangle(x + width - scrollbar_width, content_start_y, x + width, y + height - 10, false);

// Draw the scrollbar if needed
if (total_height > height) {
    var scrollbar_color = c_gray;
    if (scrollbar_hover) scrollbar_color = c_silver;
    if (scrollbar_dragging) scrollbar_color = c_white;
    
    draw_set_color(scrollbar_color);
    draw_rectangle(
        x + width - scrollbar_width + 2,
        content_start_y + scrollbar_y,
        x + width - 2,
        content_start_y + scrollbar_y + scrollbar_height,
        false
    );
}


// Reset to the default font and text size
draw_set_font(default_font);


// Free the custom font if it's no longer needed
font_delete(custom_font);