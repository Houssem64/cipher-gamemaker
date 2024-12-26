// In obj_terminal_controller Step Event
if(keyboard_check_pressed(vk_escape)) {
	 close_terminal_and_restore();
    //terminal_open = false;
    
    //// Store all the current layer visibility states
    //var layers = layer_get_all();
    //var num_layers = array_length(layers);
    
    //// Switch rooms
    //room_goto(global.previous_room);
    
    //// After room switch, make sure everything is visible
    //room_persistent = false;
    
    //// Reset layer visibility
    //var new_layers = layer_get_all();
    //for(var i = 0; i < array_length(new_layers); i++) {
    //    layer_set_visible(new_layers[i], true);
    //}
    
    //// Clean up terminal-related objects
    //with(obj_terminal) {
    //    persistent = false;
    //    instance_destroy();
    //}
}