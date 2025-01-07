if (mouse_check_button_pressed(mb_left)) {
    // Check navigation buttons
    if (point_in_rectangle(mouse_x, mouse_y, x + 5, y + 25, x + 25, y + 45)) {
        // Back button
        if (nav_position > 0) {
            nav_position--;
            current_path = ds_list_find_value(nav_history, nav_position);
            UpdateFileList();
        }
    } else if (point_in_rectangle(mouse_x, mouse_y, x + 30, y + 25, x + 50, y + 45)) {
        // Forward button
        if (nav_position < ds_list_size(nav_history) - 1) {
            nav_position++;
            current_path = ds_list_find_value(nav_history, nav_position);
            UpdateFileList();
        }
    } else if (point_in_rectangle(mouse_x, mouse_y, x + 60, y + 25, x + width - 5, y + 45)) {
        // Address bar click
        typing_path = true;
        temp_path = current_path;
        keyboard_string = temp_path;
    } else if (point_in_rectangle(mouse_x, mouse_y, x + 5, y + 70, x + width - 5, y + height - 5)) {
        // File list click
        var clicked_index = scroll_offset + floor((mouse_y - (y + 75)) / 20);
        
        if (clicked_index >= 0 && clicked_index < ds_list_size(file_list)) {
            selected_file = ds_list_find_value(file_list, clicked_index);
            
            // Double click handling
            if (mouse_check_button_pressed(mb_left) && mouse_check_button_pressed(mb_left)) {
                var _details = ds_map_find_value(file_details, selected_file);
                var _is_dir = string_pos("DIR", _details) > 0;
                
                if (_is_dir) {
                    if (selected_file == "..") {
                        // Go up one directory
                        var _last_slash = string_last_pos("/", current_path);
                        current_path = string_copy(current_path, 1, _last_slash);
                    } else {
                        // Enter selected directory
                        current_path += selected_file + "/";
                    }
                    
                    // Update navigation history
                    while (ds_list_size(nav_history) > nav_position + 1) {
                        ds_list_delete(nav_history, ds_list_size(nav_history) - 1);
                    }
                    ds_list_add(nav_history, current_path);
                    nav_position++;
                    
                    UpdateFileList();
                    selected_file = "";
                }
            }
        }
    } else {
        typing_path = false;
    }
}
if (typing_path) {
    temp_path = keyboard_string;
    
    if (keyboard_check_pressed(vk_enter)) {
        // Convert path to use forward slashes
        temp_path = string_replace_all(temp_path, "\\", "/");
        
        if (directory_exists(temp_path)) {
            current_path = temp_path;
            if (string_char_at(current_path, string_length(current_path)) != "/") {
                current_path += "/";
            }
            
            // Update navigation history
            while (ds_list_size(nav_history) > nav_position + 1) {
                ds_list_delete(nav_history, ds_list_size(nav_history) - 1);
            }
            ds_list_add(nav_history, current_path);
            nav_position++;
            
            UpdateFileList();
        }
        typing_path = false;
    }
}

// Update the directory navigation code:
if (selected_file == "..") {
    // Go up one directory
    var _last_slash = string_last_pos("/", current_path);
    current_path = string_copy(current_path, 1, _last_slash - 1);
    // Make sure we still have a trailing slash
    if (string_char_at(current_path, string_length(current_path)) != "/") {
        current_path += "/";
    }
} else {
    // Enter selected directory
    current_path += selected_file + "/";
}