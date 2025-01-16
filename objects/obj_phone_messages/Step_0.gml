if (!phone.state.visible) exit;

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// Handle scrolling
if (mouse_check_button_pressed(mb_left)) {
    is_dragging = true;
    drag_start_y = my;
}

if (mouse_check_button_released(mb_left)) {
    is_dragging = false;
}

if (is_dragging) {
    scroll_y += my - drag_start_y;
    drag_start_y = my;
}