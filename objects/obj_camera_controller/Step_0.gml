if (room_get_name(room) == "rm_computer" or room_get_name(room) == "rm_GameOver" ) {
view_height = 1080
view_width= 1920
surface_resize(application_surface, view_width , view_height);
} else {
view_width = 1920/6;
view_height = 1080/6;
window_set_size(view_width * window_scale, view_height * window_scale);
}
