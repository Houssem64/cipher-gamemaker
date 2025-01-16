if (variable_global_exists("game_initialized") == false) {
    global.game_initialized = true;
    global.door_solid = true;  // Set initial door state
}
// Create Event of obj_GameController (or any persistent object)
global.paused = false; // Initialize the pause state
saved_positions = ds_map_create();
if (instance_exists(obj_game_manager)) {
    var room_key = string(room);
    if (ds_map_exists(obj_game_manager.saved_positions, room_key)) {
        var pos = obj_game_manager.saved_positions[? room_key];
        x = pos[0];
        y = pos[1];
    }
}
// Set the delay in steps (e.g., 60 steps = 1 second at 60 FPS)
alarm[0] = 60; // Replace [0] with any available alarm index


global.currentRoom = 0

 

