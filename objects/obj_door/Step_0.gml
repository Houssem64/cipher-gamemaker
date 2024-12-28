//// Check for interaction
//if (distance_to_object(obj_Player) < 50) && (keyboard_check_pressed(ord("E"))) {
//    if (image_speed == 0) {
//        image_speed = 1;  // Start animation
//    }
//}
var x1 = x
var y1 = y+20
var x2 = x+10
var y2 = y+10



if(!has_been_opened) {
    image_speed = 0;
    image_index = 0;
    global.door_solid = true;  // Door is solid while closed
     if(keyboard_check_pressed(ord("E"))&& !global.openable) {
           var dialog = instance_create_layer(0, 0, "Instances", obj_dialog_manager);
dialog.start_dialog(["Complete current missions to unlock the door"]);
dialog.callback_object = id;

dialog.callback_script = function() {
   
    // Put your code here
};
        }
	if (!collision_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, obj_Player, false, true)) {
	 popup_id.visible = false;
	}
    if(collision_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, obj_Player, false, true)) {
        popup_id.visible = true;
        
        if(keyboard_check_pressed(ord("E"))&& global.openable) {
            has_been_opened = true;
            image_speed = 1;
            global.door_solid = false;  // Door becomes passable when opening
			  popup_id.visible = false;
        }
    } 
}
if(collision_rectangle(x1,y1,x2,y2,obj_Player,true,false))
{
  room_goto(Level1);
}

if (image_speed > 0) && (image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
}
//// Check if animation has reached the last frame
//if (image_speed > 0) && (image_index >= image_number - 1) {
//    image_speed = 0;  // Stop the animation
//    image_index = image_number - 1;  // Stay on last frame
//}