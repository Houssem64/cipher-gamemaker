
//  if (room_get_name(room) == "Room1") {
	  
//  var dialog = instance_create_layer(0, 0, "UI", obj_dialog_manager);
// dialog.start_dialog(["First message", "Second message", "Third message"]);
//  dialog.callback_object = id;

//dialog.callback_script = function() {
   
//    // Put your code here
//};

//   }

register_app("1", "TEST", c_lime, {
    // Initial state variables
});

// Add a new case in the draw_app function
function draw_app(_app_id) {
    var _app = app_system.apps[? _app_id];
    switch(_app_id) {
        case "TEST":
            draw_your_new_app(_app);
            break;
    }
}