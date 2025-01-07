 
 event_inherited()
 
 if (point_in_rectangle(mouse_x, mouse_y, x + 5, y + 30, x + width - 5, y + height - 5)) {
        var clicked_index = scroll_offset + floor((mouse_y - (y + 30)) / 20);
        
        if (clicked_index >= 0 && clicked_index < ds_list_size(file_list)) {
            selected_file = ds_list_find_value(file_list, clicked_index);
            
            // Handle double-click to open directories
            if (mouse_check_button_pressed(mb_left) && directory_exists(current_path + selected_file)) {
                if (selected_file == "..") {
                    // Go up one directory
                    var _last_slash = string_last_pos("/" , current_path);
                    current_path = string_copy(current_path, 1, _last_slash);
                } else {
                    // Enter selected directory
                    current_path += selected_file + "/";
                }
                UpdateFileList();
                selected_file = "";
            }
        }
    }