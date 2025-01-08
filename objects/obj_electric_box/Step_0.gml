// Check if the player interacts with the fuse box (e.g., presses a key)
var x1 = x-5
var y1 = y -5
var x2 = x +6
var y2 = y +12
 if (!is_interacted) {
  if (!collision_rectangle(x1, y1,x2, y2, obj_Player, false, true)) {
        popup_id.visible = false;
    } else {
        popup_id.visible = true;
        // Check if the player presses "E" and the door is openable
        if ( keyboard_check_pressed(ord("E"))) { // Replace with your interaction key
     popup_id.visible = false;
        is_interacted = true;
        camera_object.is_active = false; // Disable the camera
		audio_play_sound(snd_interruptor,0,false)
		camera_object.image_speed = 0; // Stop the animation
		camera_object.image_index = 0; // Set the frame to frame 1 (index 0)
		
		 
    }
}

} 