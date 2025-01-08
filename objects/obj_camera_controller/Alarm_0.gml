// This ensures the window is properly centered after sizing
var _display_width = display_get_width();
var _display_height = display_get_height();
var _window_width = view_width * window_scale;
var _window_height = view_height * window_scale;
window_set_position(_display_width/2 - _window_width/2, _display_height/2 - _window_height/2);