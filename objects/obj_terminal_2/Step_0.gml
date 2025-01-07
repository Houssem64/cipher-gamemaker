 event_inherited();
    
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    // Title bar dragging
    if (!dragging_window) {
        if (mx >= window_x && mx <= window_x + window_width && 
            my >= window_y && my <= window_y + 20) {
            if (mouse_check_button_pressed(mb_left)) {
                dragging_window = true;
                drag_offset_x = mx - window_x;
                drag_offset_y = my - window_y;
            }
        }
    } else {
        if (mouse_check_button(mb_left)) {
            window_x = mx - drag_offset_x;
            window_y = my - drag_offset_y;
            x = window_x;
            y = window_y;
        } else {
            dragging_window = false;
        }
    }
    
    // Close button
    if (mx >= window_x + window_width - 25 && mx <= window_x + window_width - 5 && 
        my >= window_y + 5 && my <= window_y + 15) {
        close_button_hover = true;
        if (mouse_check_button_pressed(mb_left)) {
            instance_destroy();
        }
    } else {
        close_button_hover = false;
    }
    
    // Fullscreen button
    if (mx >= window_x + window_width - 50 && mx <= window_x + window_width - 30 && 
        my >= window_y + 5 && my <= window_y + 15) {
        fullscreen_button_hover = true;
        if (mouse_check_button_pressed(mb_left)) {
            // Implement fullscreen toggle logic here
        }
    } else {
        fullscreen_button_hover = false;
    }
    
    // Mouse wheel scrolling
    if (mouse_wheel_up()) {
        scroll_position = max(scroll_position - 20, 0);
    }
    if (mouse_wheel_down()) {
        scroll_position = min(scroll_position + 20, total_height - terminal_height);
    }
    
    // Scrollbar dragging
    if (scrollbar_visible && mouse_check_button(mb_left)) {
        var scroll_area = terminal_y + terminal_height;
        if (mx >= terminal_x + terminal_width - scrollbar_width && mx <= terminal_x + terminal_width &&
            my >= terminal_y && my <= scroll_area) {
            var scroll_ratio = (my - terminal_y) / terminal_height;
            scroll_position = scroll_ratio * (total_height - terminal_height);
            scroll_position = clamp(scroll_position, 0, total_height - terminal_height);
        }
    }
    
    // Update terminal position when window moves
    terminal_x = window_x;
    terminal_y = window_y + 20;
    terminal_width = window_width;
    terminal_height = window_height - 20;