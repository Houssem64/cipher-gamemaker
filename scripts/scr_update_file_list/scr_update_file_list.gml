/// @description UpdateFileList - Script
function UpdateFileList() {
    ds_list_clear(file_list);
    
    // Add parent directory option if not at root
    if (current_path != working_directory) {
        ds_list_add(file_list, "..");
    }
    
    // Get all files and directories
    var _file = file_find_first(current_path + "*.*", fa_directory);
    while (_file != "") {
        ds_list_add(file_list, _file);
        _file = file_find_next();
    }
    file_find_close();
    
    // Sort the list (directories first)
    ds_list_sort(file_list, true);
}