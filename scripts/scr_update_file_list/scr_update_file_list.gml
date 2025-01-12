function UpdateFileList() {
    ds_list_clear(file_list);
    ds_map_clear(file_details);
    
    // Ensure proper path format
    if (string_char_at(current_path, string_length(current_path)) != "/") {
        current_path += "/";
    }
    current_path = string_replace_all(current_path, "\\", "/");
    
    // Add parent directory if not in root
    if (current_path != workingdirectory) {
        ds_list_add(file_list, "..");
        ds_map_add(file_details, "..", "DIR|" + date_datetime_string(current_time) + "|0");
    }
    
    // Find all files and directories
    var _file = file_find_first(current_path + "*.*", fa_directory);
    while (_file != "") {
        if (_file != "." && _file != "..") {
            ds_list_add(file_list, _file);
            
            var _full_path = current_path + _file;
            var _is_dir = directory_exists(_full_path);
            var _size = 0;
            var _date = date_datetime_string(current_time);
            
            try {
                if (!_is_dir) {
                    if (file_exists(_full_path)) {
                        _size = file_size(_full_path);
                        _date = date_datetime_string(file_modified_time(_full_path));
                    }
                } else {
                    _date = date_datetime_string(file_modified_time(_full_path));
                }
            } catch(_) {
                _size = 0;
                _date = date_datetime_string(current_time);
            }
            
            var _details = (_is_dir ? "DIR|" : "FILE|") + _date + "|" + string(_size);
            ds_map_add(file_details, _file, _details);
        }
        _file = file_find_next();
    }
    file_find_close();
    
    // Sort directories and files separately
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
   
    // Sort both lists
    ds_list_sort(_temp_dirs, true);
    ds_list_sort(_temp_files, true);
    
    // Combine sorted lists
    ds_list_clear(file_list);
    
    // Copy directories first
    for(var i = 0; i < ds_list_size(_temp_dirs); i++) {
        ds_list_add(file_list, ds_list_find_value(_temp_dirs, i));
    }
    
    // Then copy files
    for(var i = 0; i < ds_list_size(_temp_files); i++) {
        ds_list_add(file_list, ds_list_find_value(_temp_files, i));
    }
    
    // Cleanup
    ds_list_destroy(_temp_dirs);
    ds_list_destroy(_temp_files);
}