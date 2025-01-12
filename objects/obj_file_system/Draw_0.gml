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

event_inherited(); // Draw parent window elements first

// Draw address bar
draw_set_color(c_white);
draw_rectangle(x + 5, y + 25, x + width - 5, y + 45, false);
draw_set_color(c_black);
draw_rectangle(x + 5, y + 25, x + width - 5, y + 45, true);

// Back button
draw_set_color(can_go_back ? c_gray : c_dkgray);
draw_rectangle(x + 5, y + 25, x + 25, y + 45, false);
draw_set_color(can_go_back ? c_black : c_gray);
draw_set_color(c_aqua)
draw_text(x + 12, y + 25, "<");

// Forward button
draw_set_color(can_go_forward ? c_gray : c_dkgray);
draw_rectangle(x + 30, y + 25, x + 50, y + 45, false);
draw_set_color(can_go_forward ? c_black : c_gray);
draw_set_color(c_aqua)
draw_text(x + 37, y + 25, ">");

// Draw address bar content
draw_set_color(c_black);
if (typing_path) {
    draw_text(x + 60, y + 30, temp_path + "|");
} else {
    draw_text(x + 60, y + 30, current_path);
}

// Draw column headers
var _header_y = y + 50;
draw_line(x, _header_y, x + width, _header_y);
draw_text(x + 25, _header_y, "Name");
draw_text(x + 25 + name_column_width, _header_y, "Size");
draw_text(x + 25 + name_column_width + size_column_width, _header_y, "Date Modified");
// ... previous drawing code ...

// Draw files and directories
var _y_pos = y + 75;
var _items_drawn = 0;

for (var i = scroll_offset; i < ds_list_size(file_list) && _items_drawn < max_items_visible; i++) {
    var _item = ds_list_find_value(file_list, i);
    var _details = ds_map_find_value(file_details, _item);
    
    if (_details != undefined) {
        var _detail_array = string_split(_details, "|");
        var _is_dir = _detail_array[0] == "DIR";
        
        // Highlight selected item
        if (_item == selected_file) {
            draw_set_color(c_blue);
            draw_set_alpha(0.3);
            draw_rectangle(x + 5, _y_pos - 2, x + width - 5, _y_pos + 18, false);
            draw_set_alpha(1);
        }
        
        // Draw item text
        draw_set_color(c_black);
        draw_text(x + 10, _y_pos, _is_dir ? "📁" : "📄");
        draw_text(x + 25, _y_pos, _item);
        
        // Draw size and date
        //if (!_is_dir) {
        //    try {
        //        var _size = real(_detail_array[2]);
        //        draw_text(x + 25 + name_column_width, _y_pos, FormatFileSize(_size));
        //    } catch(_) {
        //        draw_text(x + 25 + name_column_width, _y_pos, "???");
        //    }
        //} else {
        //    draw_text(x + 25 + name_column_width, _y_pos, "");
        //}
		if (!_is_dir || _item == "..") {
    // Size column
    draw_text(x + 25 + name_column_width, _y_pos, 
        _is_dir ? "" : FormatFileSize(real(_detail_array[2])));
    
    // Date column
    draw_text(x + 25 + name_column_width + size_column_width, _y_pos, 
        _detail_array[1]);  // This should now show properly formatted dates
}
        
        //// Draw date
        //draw_text(x + 25 + name_column_width + size_column_width, _y_pos, _detail_array[1]);
    }
    
    _y_pos += 20;
    _items_drawn++;
}