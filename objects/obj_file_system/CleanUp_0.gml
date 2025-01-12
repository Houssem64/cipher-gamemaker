ds_list_destroy(file_list);
if (ds_exists(nav_history, ds_type_list)) {
    ds_list_destroy(nav_history);
}