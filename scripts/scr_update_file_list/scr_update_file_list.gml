function UpdateFileList() {
	    AddToHistory(current_path);

    ds_list_clear(file_list);
    ds_map_clear(file_details);
    
    // Normalize path
    current_path = string_replace_all(current_path, "\\", "/");
    if (string_char_at(current_path, string_length(current_path)) != "/") {
        current_path += "/";
    }
    
    // Get current directory content
    var path_parts = string_split(string_replace_all(current_path, "/", " "), " ");
    var current_dir = root_directory;
    var current_content = current_dir.content;
    
    // Navigate to current directory
    for(var i = 0; i < array_length(path_parts); i++) {
        var part = path_parts[i];
        if (part != "" && part != "C:") {
            if (variable_struct_exists(current_content, part)) {
                current_content = current_content[$ part].content;
            }
        }
    }
    
    // Add parent directory if not in root
   if (current_path != "C:/") {
        ds_list_add(file_list, "..");
        ds_map_add(file_details, "..", "DIR|" + FormatDateTime(date_current_datetime()) + "|0");
    }
    
    
    // Add directories and files
 var names = variable_struct_get_names(current_content);
    for(var i = 0; i < array_length(names); i++) {
        var item_name = names[i];
        var item = current_content[$ item_name];
        
        ds_list_add(file_list, item_name);
        
        if (item.type == "DIR") {
            ds_map_add(file_details, item_name, 
                "DIR|" + FormatDateTime(item.date) + "|0");
        } else {
            ds_map_add(file_details, item_name,
                "FILE|" + FormatDateTime(item.date) + "|" + string(item.size));
        }
    }
    
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
    
    ds_list_sort(_temp_dirs, true);
    ds_list_sort(_temp_files, true);
    
    ds_list_clear(file_list);
    
    // Copy directories first
    for(var i = 0; i < ds_list_size(_temp_dirs); i++) {
        ds_list_add(file_list, ds_list_find_value(_temp_dirs, i));
    }
    
    // Then copy files
    for(var i = 0; i < ds_list_size(_temp_files); i++) {
        ds_list_add(file_list, ds_list_find_value(_temp_files, i));
    }
    
    ds_list_destroy(_temp_dirs);
    ds_list_destroy(_temp_files);
}