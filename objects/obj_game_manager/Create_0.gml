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


global.currentRoom = 0

   if (room_get_name(room) == "Room1") {
	  
  var dialog = instance_create_layer(0, 0, "UI", obj_dialog_manager);
 dialog.start_dialog(["First message", "Second message", "Third message"]);
  dialog.callback_object = id;

dialog.callback_script = function() {
   
    // Put your code here
};

   }

