if (variable_global_exists("game_initialized") == false) {
    global.game_initialized = true;
    global.door_solid = true;  // Set initial door state
}
// Create Event of obj_GameController (or any persistent object)
global.paused = false; // Initialize the pause state


global.currentRoom = 0