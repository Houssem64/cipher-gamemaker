//event_inherited()
// First check if we're clicking within the file list area
var file_list_top = y + 70;  // Starting Y position of file list
var file_list_bottom = y + height - 5;
var file_list_left = x + 5;
var file_list_right = x + width - 5;

if (point_in_rectangle(mouse_x, mouse_y, 
    file_list_left, file_list_top, 
    file_list_right, file_list_bottom)) {
    
    // Calculate which item was clicked
    var item_height = 20;  // Height of each item
    var relative_y = mouse_y - file_list_top;
    var clicked_index = floor(relative_y / item_height);
    
    // Check if the clicked index is valid
    if (clicked_index >= 0 && clicked_index < ds_list_size(file_list)) {
        // Set the selected file
        selected_file = ds_list_find_value(file_list, clicked_index);
        
        // Double click handling
        if (double_clicked()) {
            var _details = ds_map_find_value(file_details, selected_file);
            if (_details != undefined) {
                var _detail_array = string_split(_details, "|");
                var _is_dir = _detail_array[0] == "DIR";
                
                if (_is_dir) {
                    // Handle directory navigation
                    if (selected_file == "..") {
                        // Go up one directory level
                        var path_parts = string_split(string_replace_all(current_path, "\\", "/"), "/");
                        var new_path = "";
                        
                        // Rebuild path excluding the last directory
                        for (var i = 0; i < array_length(path_parts) - 2; i++) {
                            if (path_parts[i] != "") {
                                new_path += path_parts[i] + "/";
                            }
                        }
                        
                        // Ensure we don't go above root
                        if (new_path == "") new_path = "C:/";
                        current_path = new_path;
                    } else {
                        // Enter the selected directory
                        current_path += selected_file + "/";
                    }
                    
                    // Update the file list
                    UpdateFileList();
                }
            }
        }
    }
}

// Navigation buttons and address bar handling remains the same...

// Check for clicks in the navigation buttons area
var nav_top = y + 25;
var nav_bottom = y + 45;

// Back button
if (point_in_rectangle(mouse_x, mouse_y, 
    x + 5, nav_top, 
    x + 25, nav_bottom)) {
    if (nav_position > 0) {
        nav_position--;
        current_path = ds_list_find_value(nav_history, nav_position);
        UpdateFileList();
    }
}

// Forward button
if (point_in_rectangle(mouse_x, mouse_y, 
    x + 30, nav_top, 
    x + 50, nav_bottom)) {
    if (nav_position < ds_list_size(nav_history) - 1) {
        nav_position++;
        current_path = ds_list_find_value(nav_history, nav_position);
        UpdateFileList();
    }
}

// Address bar
if (point_in_rectangle(mouse_x, mouse_y,
    x + 60, nav_top,
    x + width - 5, nav_bottom)) {
    typing_path = true;
    temp_path = current_path;
}

// If clicking outside the address bar while typing
if (typing_path) {
    var nav_top = y + 25;
    var nav_bottom = y + 45;
    
    if (!point_in_rectangle(mouse_x, mouse_y,
        x + 60, nav_top,
        x + width - 5, nav_bottom)) {
        
        typing_path = false;
        // Optionally validate and navigate to the typed path here
    }
}