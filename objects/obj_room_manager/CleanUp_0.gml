// Clean Up Event - Important to prevent memory leaks!
function cleanup_room_states() {
    var room_key = ds_map_find_first(room_states);
    while (!is_undefined(room_key)) {
        var room_data = room_states[? room_key];
        
        // Clean up instance data maps
        var inst_key = ds_map_find_first(room_data);
        while (!is_undefined(inst_key)) {
            var inst_data = room_data[? inst_key];
            ds_map_destroy(inst_data);
            inst_key = ds_map_find_next(room_data, inst_key);
        }
        
        // Clean up room data map
        ds_map_destroy(room_data);
        room_key = ds_map_find_next(room_states, room_key);
    }
    
    // Finally, destroy the room states map
    ds_map_destroy(room_states);
}