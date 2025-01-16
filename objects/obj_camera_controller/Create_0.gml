// Create Event
view_width = 1920/6
view_height = 1080/6;
window_scale = 3;

// Setup window and view
window_set_size(view_width * window_scale, view_height * window_scale);
alarm[0] = 1;
window_set_fullscreen(true);
surface_resize(application_surface, view_width * window_scale, view_height * window_scale);