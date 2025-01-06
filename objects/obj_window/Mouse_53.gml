

//// Bring this window to the top

//  if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height)) {
//        // Bring window to front
//        with (obj_window_manager) {
//            other.depth = next_depth--;
//        }
//    }
//// Global Left Pressed Event of obj_window
//if (mouse_x >= x && mouse_x <= x + width && mouse_y >= y && mouse_y <= y + 20) {
//    dragging = true;
//    x_offset = mouse_x - x;
//    y_offset = mouse_y - y;
//}
//// Global Left Pressed Event of obj_window (additional code)
//if (mouse_x >= x + width - 10 && mouse_x <= x + width && mouse_y >= y + height - 10 && mouse_y <= y + height) {
//    resizing = true;
//}