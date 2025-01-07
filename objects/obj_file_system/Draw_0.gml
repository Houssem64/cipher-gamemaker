//// Inherit window behavior from obj_window
//event_inherited();

//// Update file system dimensions based on window size
//file_system_x = x + 10;
//file_system_y = y + 30;
//file_system_width = width - 20;
//file_system_height = height - 40;

//// Handle mouse clicks
//if (mouse_check_button_pressed(mb_left)) {
//    var mx = mouse_x;
//    var my = mouse_y;

//    // Check if a file or directory is clicked
//    for (var i = 0; i < array_length(files); i++) {
//        var file_y = file_system_y + 10 + (i * 30) - scroll_position;
//        if (point_in_rectangle(mx, my, file_system_x, file_y, file_system_x + file_system_width, file_y + 30)) {
//            selected_file = i;

//            // Handle directory navigation
//            if (files[i].type == "directory") {
//                current_directory += files[i].name + "/";
//                load_directory(current_directory);
//            } else {
//                // Handle file selection (e.g., open the file)
//                show_debug_message("Selected file: " + files[i].name);
//            }
//            break;
//        }
//    }
//}

//// Handle scrolling with mouse wheel
//if (mouse_wheel_up()) {
//    scroll_position = max(scroll_position - 20, 0);
//}
//if (mouse_wheel_down()) {
//    scroll_position = min(scroll_position + 20, total_height - file_system_height);
//}


/// @description Draw Event
event_inherited(); // Draw parent window elements first

// Draw file list area
draw_set_color(c_white);
draw_rectangle(x + 5, y + 25, x + width - 5, y + height - 5, false);

// Draw files and directories
draw_set_color(c_black);


var _y_pos = y + 30;
var _items_drawn = 0;

for (var i = scroll_offset; i < ds_list_size(file_list) && _items_drawn < max_items_visible; i++) {
    var _item = ds_list_find_value(file_list, i);
    var _is_dir = directory_exists(current_path + _item);
    
    // Highlight selected item
    if (_item == selected_file) {
        draw_set_color(c_blue);
        draw_rectangle(x + 5, _y_pos, x + width - 5, _y_pos + 18, false);
        draw_set_color(c_white);
    } else {
        draw_set_color(c_black);
    }
    

    // Draw filename
    draw_text(x + 30, _y_pos, _item);
    
    _y_pos += 20;
    _items_drawn++;
}