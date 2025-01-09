// Save position before leaving the room
if (instance_exists(obj_game_manager)) {
    var room_key = string(room);
    var pos = array_create(2);
    pos[0] = x;       // This is obj_Player's x position
    pos[1] = y;       // This is obj_Player's y position
    ds_map_set(obj_game_manager.saved_positions, room_key, pos);
}