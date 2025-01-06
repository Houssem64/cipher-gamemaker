// Handle opening new windows (e.g., on key press)
if (keyboard_check_pressed(ord("N"))) {
    // Create a new window
    var new_window = instance_create_layer(100, 100, "Instances", obj_window);
    new_window.window_title = "New Window";
    new_window.window_content = "This is a new window!";
    array_push(open_windows, new_window);
}

// Handle closing windows (e.g., on key press)
if (keyboard_check_pressed(ord("C"))) {
    if (array_length(open_windows) > 0) {
        var last_window = open_windows[array_length(open_windows) - 1];
        instance_destroy(last_window); // Close the last opened window
        array_delete(open_windows, array_length(open_windows) - 1, 1); // Remove from list
    }
}
if (keyboard_check_pressed(ord("E"))) {
    var email_window = instance_create_layer(100, 100, "Instances", obj_email_window);
    email_window.window_title = "Email App";
    array_push(open_windows, email_window);
}