if (variable_global_exists("game_initialized") == false) {
    global.game_initialized = true;
    global.door_solid = true;  // Set initial door state
}
// Create Event of obj_GameController (or any persistent object)
global.paused = false; // Initialize the pause state


global.currentRoom = 0

   if (room_get_name(room) == "Room1") {
	  
  var dialog = instance_create_layer(0, 0, "UI", obj_dialog_manager);
 dialog.start_dialog(["First message", "Second message", "Third message"]);
  dialog.callback_object = id;

dialog.callback_script = function() {
   
    // Put your code here
};

   }

