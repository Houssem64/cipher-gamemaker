function UpdateFileList() {
    ds_list_clear(file_list);
    ds_map_clear(file_details);
    
    if (string_char_at(current_path, string_length(current_path)) != "/") {
        current_path += "/";
    }
    
    current_path = string_replace_all(current_path, "\\", "/");
    
    if (current_path != working_directory) {
        ds_list_add(file_list, "..");
        ds_map_add(file_details, "..", "DIR|" + date_datetime_string(current_time) + "|0");
    }
    
    var _file = file_find_first(current_path + "*.*", fa_directory);
    while (_file != "") {
        if (_file != "." && _file != "..") {
            ds_list_add(file_list, _file);
            
            var _full_path = current_path + _file;
            var _is_dir = directory_exists(_full_path);
            var _size = 0;
            var _date = date_datetime_string(current_time);
            
            if (!_is_dir && file_exists(_full_path)) {
                _size = file_size(_full_path);
                try {
                    _date = date_datetime_string(file_modified_time(_full_path));
                } catch(_) {
                }
            }
            
            var _details = (_is_dir ? "DIR|" : "FILE|") + _date + "|" + string(_size);
            ds_map_add(file_details, _file, _details);
        }
        _file = file_find_next();
    }
    file_find_close();
    
    var _temp_dirs = ds_list_create();
    var _temp_files = ds_list_create();
    
    for (var i = 0; i < ds_list_size(file_list); i++) {
        var _item = ds_list_find_value(file_list, i);
        if (_item == ".." || string_pos("DIR", ds_map_find_value(file_details, _item)) > 0) {
            ds_list_add(_temp_dirs, _item);
        } else {
            ds_list_add(_temp_files, _item);
        }
    }
    
    ds_list_sort(_temp_dirs, true);
    ds_list_sort(_temp_files, true);
    
    ds_list_clear(file_list);
    ds_list_copy_to(_temp_dirs, file_list);
    ds_list_copy_to(_temp_files, file_list);
    
    ds_list_destroy(_temp_dirs);
    ds_list_destroy(_temp_files);
}

function FormatFileSize(_size) {
    if (_size < 1024) return string(_size) + " B";
    if (_size < 1048576) return string(floor(_size/1024)) + " KB";
    if (_size < 1073741824) return string_format(_size/1048576, 0, 2) + " MB";
    return string_format(_size/1073741824, 0, 2) + " GB";
}

function FormatDateString(timestamp) {
    return date_datetime_string(timestamp);
}