// Load position if we have a saved position for this room
if (instance_exists(obj_game_manager)) {
    var room_key = string(room);
    if (ds_map_exists(obj_game_manager.saved_positions, room_key)) {
        var pos = obj_game_manager.saved_positions[? room_key];
        x = pos[0];   // Set obj_Player's x position
        y = pos[1];   // Set obj_Player's y position
    }
}