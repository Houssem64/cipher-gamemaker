// Mouse Event - Left Pressed
if (mouse_x >= email_icon_x && mouse_x <= email_icon_x + icon_size &&
    mouse_y >= icon_y && mouse_y <= icon_y + icon_size) {
    // Launch email app
	var  email_window = instance_create_depth(
        room_width/2 - 400, // center horizontally
        room_height/2 - 300, // center vertically
        obj_window_manager.next_depth, 
        obj_email_window
    );
	 array_push(obj_window_manager.open_windows, email_window);
    obj_window_manager.next_depth -= 1;
    //with (instance_create_layer(100, 100, "Instances", obj_email_window)) {
    //    // Set any initial properties for the email app
    //}
}

if (mouse_x >= terminal_icon_x && mouse_x <= terminal_icon_x + icon_size &&
    mouse_y >= icon_y && mouse_y <= icon_y + icon_size) {
    var terminal_window = instance_create_depth(
        room_width/2 - 400, // center horizontally
        room_height/2 - 300, // center vertically
        obj_window_manager.next_depth, 
        obj_terminal
    );
    array_push(obj_window_manager.open_windows, terminal_window);
    obj_window_manager.next_depth -= 1;
}
if (mouse_x >= file_system_icon_x && mouse_x <= file_system_icon_x + icon_size &&
    mouse_y >= icon_y && mouse_y <= icon_y + icon_size) {
    var file_window = instance_create_depth(
        room_width/2 - 400, // center horizontally
        room_height/2 - 300, // center vertically
        obj_window_manager.next_depth, 
        obj_file_system
    );
    array_push(obj_window_manager.open_windows, file_window);
    obj_window_manager.next_depth -= 1;
}