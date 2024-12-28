//// Check for interaction
//if (distance_to_object(obj_Player) < 50) && (keyboard_check_pressed(ord("E"))) {
//    if (image_speed == 0) {
//        image_speed = 1;  // Start animation
//    }
//}



if(!has_been_opened) {
    image_speed = 0;
    image_index = 0;
    global.door_solid = true;  // Door is solid while closed
    
    if(collision_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, obj_Player, false, true)) {
        popup_id.visible = true;
        
        if(keyboard_check_pressed(ord("E"))) {
            has_been_opened = true;
            image_speed = 1;
            global.door_solid = false;  // Door becomes passable when opening
        }
    } else {
        popup_id.visible = false;
    }
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