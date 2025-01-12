function FormatFileSize(_size) {
    if (_size < 1024) return string(_size) + " B";
    if (_size < 1048576) return string(floor(_size/1024)) + " KB";
    if (_size < 1073741824) return string_format(_size/1048576, 0, 2) + " MB";
    return string_format(_size/1073741824, 0, 2) + " GB";
}

function FormatDateString(timestamp) {
    return date_datetime_string(timestamp);
}
function FormatDateTime(datetime) {
    if (datetime == undefined || datetime == 0) return "Invalid Date";
    
    var year = date_get_year(datetime);
    var month = date_get_month(datetime);
    var day = date_get_day(datetime);
    var hour = date_get_hour(datetime);
    var minute = date_get_minute(datetime);
    
    // Add leading zeros where needed
    var month_str = string(month);
    if (month < 10) month_str = "0" + month_str;
    
    var day_str = string(day);
    if (day < 10) day_str = "0" + day_str;
    
    var hour_str = string(hour);
    if (hour < 10) hour_str = "0" + hour_str;
    
    var minute_str = string(minute);
    if (minute < 10) minute_str = "0" + minute_str;
    
    return string(year) + "-" + month_str + "-" + day_str + " " + hour_str + ":" + minute_str;
}
function NavigateToDirectory(new_path) {
    if (new_path == "..") {
        // Go up one directory
        var last_slash = string_last_pos("/", current_path);
        if (last_slash > 0) {
            current_path = string_copy(current_path, 1, last_slash);
            if (string_char_at(current_path, string_length(current_path)) == "/") {
                current_path = string_copy(current_path, 1, string_length(current_path) - 1);
            }
            last_slash = string_last_pos("/", current_path);
            current_path = string_copy(current_path, 1, last_slash + 1);
        }
    } else {
        // Enter directory
        current_path += new_path + "/";
    }
    
    UpdateFileList();
}
function AddToHistory(path) {
    // Remove any forward history when a new path is added
    while (ds_list_size(nav_history) > nav_position + 1) {
        ds_list_delete(nav_history, ds_list_size(nav_history) - 1);
    }
    
    // Add new path if it's different from current
    if (nav_position < 0 || path != ds_list_find_value(nav_history, nav_position)) {
        ds_list_add(nav_history, path);
        nav_position = ds_list_size(nav_history) - 1;
    }
    
    UpdateNavigationState();
}

function UpdateNavigationState() {
    can_go_back = (nav_position > 0);
    can_go_forward = (nav_position < ds_list_size(nav_history) - 1);
}

function double_clicked() {
    static last_click_time = -1;
    static last_clicked_file = "";
    
   
    var double_click_threshold = 500; // milliseconds
    
    if (last_clicked_file == selected_file && 
        current_time - last_click_time < double_click_threshold) {
        last_click_time = -1;
        last_clicked_file = "";
        return true;
    } else {
        last_click_time = current_time;
        last_clicked_file = selected_file;
        return false;
    }
}