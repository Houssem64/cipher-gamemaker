if (surface_exists(terminal_surface)) {
    surface_free(terminal_surface);
}
ds_list_destroy(bootMessages);
ds_list_destroy(commandHistory);