

// Step Event of obj_window
if (dragging) {
    x = mouse_x - x_offset;
    y = mouse_y - y_offset;
}

// Step Event of obj_window
// Step Event of obj_window (additional code)
if (resizing) {
    width = max(min_width, mouse_x - x);
    height = max(min_height, mouse_y - y);
}

// Step Event of obj_window (constraints)
x = clamp(x, 0, room_width - width);
y = clamp(y, 0, room_height - height);


////// Step Event of obj_window
////// Check if the mouse is pressed
//if (mouse_check_button_pressed(mb_left)) {
//    // Check if the close button is clicked
//    if (mouse_x >= x + width - 25 && mouse_x <= x + width - 5 &&
//        mouse_y >= y + 5 && mouse_y <= y + 15) {
//        instance_destroy(); // Close the window
//    }
// // Check if the fit-to-screen button is clicked
//    if (mouse_x >= x + width - 50 && mouse_x <= x + width - 30 &&
//        mouse_y >= y + 5 && mouse_y <= y + 15) {
//        // Toggle fullscreen state for the window
//        if (is_fullscreen) {
//            // Restore original size and position
//            x = original_x;
//            y = original_y;
//            width = original_width;
//            height = original_height;
//        } else {
//            // Save current position and size before going fullscreen
//            original_x = x;
//            original_y = y;
//            original_width = width;
//            original_height = height;

//            // Set fullscreen size and position (minus status bar height)
//            x = 0;
//            y = 30; // Adjust for status bar height
//            width = room_width;
//            height = room_height - 30; // Adjust for status bar height
//        }
//        is_fullscreen = !is_fullscreen; // Toggle fullscreen state
//    }
//    //// Check if the fit-to-screen button is clicked
//    //if (mouse_x >= x + width - 50 && mouse_x <= x + width - 30 &&
//    //    mouse_y >= y + 5 && mouse_y <= y + 15) {
//    //    // Toggle between windowed and fullscreen modes
//    //    if (window_get_fullscreen()) {
//    //        window_set_fullscreen(false); // Exit fullscreen
//    //    } else {
//    //        window_set_fullscreen(true); // Enter fullscreen
//    //    }
//    //}
//}
if (mouse_check_button_pressed(mb_left)) {
    if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height)) {
        // Get the window manager instance
        var manager = instance_nearest(0, 0, obj_window_manager);
        if (manager != noone) {
            // Update depths of all windows
            with (obj_window) {
                if (depth < manager.next_depth) {
                    depth += 1;
                }
            }
            // Set this window's depth to be on top
            depth = manager.next_depth;
            manager.next_depth -= 1;
        }

        // Start dragging if clicking the title bar
        if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + 20)) {
            dragging = true;
            x_offset = mouse_x - x;
            y_offset = mouse_y - y;
        }
        
        // Start resizing if clicking the resize handle
        if (point_in_rectangle(mouse_x, mouse_y, 
            x + width - 10, y + height - 10, 
            x + width, y + height)) {
            resizing = true;
        }
    }
    
    // Close button
    if (point_in_rectangle(mouse_x, mouse_y,
        x + width - 25, y + 5,
        x + width - 5, y + 15)) {
        instance_destroy();
    }
    
    // Fullscreen button
    if (point_in_rectangle(mouse_x, mouse_y,
        x + width - 50, y + 5,
        x + width - 30, y + 15)) {
        if (is_fullscreen) {
            x = original_x;
            y = original_y;
            width = original_width;
            height = original_height;
        } else {
            original_x = x;
            original_y = y;
            original_width = width;
            original_height = height;
            x = 0;
            y = 30;
            width = room_width;
            height = room_height - 30;
        }
        is_fullscreen = !is_fullscreen;
    }
}





