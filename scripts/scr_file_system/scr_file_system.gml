function FormatFileSize(_size) {
    if (_size < 1024) return string(_size) + " B";
    if (_size < 1048576) return string(floor(_size/1024)) + " KB";
    if (_size < 1073741824) return string_format(_size/1048576, 0, 2) + " MB";
    return string_format(_size/1073741824, 0, 2) + " GB";
}

function FormatDateString(timestamp) {
    return date_datetime_string(timestamp);
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