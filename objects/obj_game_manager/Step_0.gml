// Step Event of obj_GameController
if (keyboard_check_pressed(ord("P"))) { // Use "P" or any other key
    global.paused = !global.paused; // Toggle pause state
}

// Step Event of obj_GameController
if (keyboard_check_pressed(ord("P"))) { // Use "P" or any other key
    global.paused = !global.paused; // Toggle pause state

    if (global.paused) {
        instance_deactivate_all(true); // Deactivate all instances except the caller
        instance_create_layer(room_width / 2, room_height / 2, "UI", obj_Pause_menu); // Create the pause menu
    } else {
        instance_activate_all(); // Reactivate all instances
        with (obj_Pause_menu) {
            instance_destroy(); // Destroy the pause menu
        }
    }
}