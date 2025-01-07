function scr_camera(width, height) {
    // Set the global resolution variables
    global.res_width = width;
    global.res_height = height;

    // Set the window size
    window_set_size(global.res_width, global.res_height);

    // Resize the application surface to match the new resolution
    surface_resize(application_surface, global.res_width, global.res_height);
}