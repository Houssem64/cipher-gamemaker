// In obj_global_controller Create Event


function close_terminal_and_restore() {
    if (!global.terminal_open) return;

    global.terminal_open = false;

    var layers = layer_get_all();
    var num_layers = array_length(layers);

    if (room_exists(global.previous_room)) {
        room_goto(global.previous_room);
    } else {
        show_debug_message("Error: Previous room does not exist!");
        return;
    }

    room_persistent = false;

    var new_layers = layer_get_all();
    for (var i = 0; i < array_length(new_layers); i++) {
        layer_set_visible(new_layers[i], true);
    }

    with (obj_terminal_old) {
        persistent = false;
        instance_destroy();
    }
}
