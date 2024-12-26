///// @function close_terminal_and_restore()
///// @desc Closes the terminal, switches to the previous room, and resets layer visibility.
//function close_terminal_and_restore() {
//    // Check if the terminal is open
//    if (!terminal_open) return;

//    terminal_open = false;

//    // Store the current room layers
//    var layers = layer_get_all();
//    var num_layers = array_length(layers);

//    // Switch back to the previous room
//    if (room_exists(global.previous_room)) {
//        room_goto(global.previous_room);
//    } else {
//        show_debug_message("Error: Previous room does not exist!");
//        return;
//    }

//    // Ensure the new room is not persistent
//    room_persistent = false;

//    // Restore layer visibility
//    var new_layers = layer_get_all();
//    for (var i = 0; i < array_length(new_layers); i++) {
//        layer_set_visible(new_layers[i], true);
//    }

//    // Clean up terminal-related objects
//    with (obj_terminal) {
//        persistent = false;
//        instance_destroy();
//    }
//}
