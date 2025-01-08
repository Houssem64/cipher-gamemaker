// Calculate the detection rectangle's position (centered on the camera)
var left = x
var top = y 
var right = x 
var bottom = y 
// Only run detection logic if the camera is active
if (is_active) {
    // Calculate the detection rectangle's position (centered on the camera)
    var detection_zone = collision_rectangle(x - 100, y + 80, x + 40, y - 10, obj_Player, false, true);

    // Check if the player is inside the detection rectangle
    if (detection_zone) {
        // Player is in the detection area
        if (!player_spotted) {
            player_spotted = true;
            spotted_timer = 0;
           
            if (!instance_exists(exclamation_instance)) {
                exclamation_instance = instance_create_layer(x, y - 5, "Instances", exclamation_object); // Adjust position as needed
            }
            exclamation_instance.image_speed = 1; // Play the exclamation animation
        } else {
            spotted_timer++;
            if (spotted_timer >= alarm_duration) {
                // Trigger the alarm
                if (!audio_is_playing(alarm_sound)) {
                    audio_play_sound(alarm_sound, 0, false);
                }
            }
        }
    } else {
        // Player is not in the detection area
        player_spotted = false;
        spotted_timer = 0;
        if (instance_exists(exclamation_instance)) {
            instance_destroy(exclamation_instance);
            exclamation_instance = noone;
        }
    }
} 


//var detection_zone = collision_rectangle(x-100 , y+80, x+40 , y-10,obj_Player,false,true)
//// Check if the player is inside the detection rectangle
//var player = obj_Player; // Replace with your player object
//if (detection_zone) {
//    // Player is in the detection area
//    if (!player_spotted) {
//        player_spotted = true;
//        spotted_timer = 0;
//		image_speed = 1; // Play the animation
//		 if (!instance_exists(exclamation_instance)) {
//            exclamation_instance = instance_create_layer(x, y-5, "Instances", exclamation_object); // Adjust position as needed
//		 }
//		   exclamation_instance.image_speed = 1; // Play the exclamation animation
//    } else {
//        spotted_timer++;
//        if (spotted_timer >= alarm_duration) {
//            // Trigger the alarm
//            if (!audio_is_playing(alarm_sound)) {
//                audio_play_sound(alarm_sound, 0, false);
//            }
//        }
//    }
//} else {
//    // Player is not in the detection area
//    player_spotted = false;
//    spotted_timer = 0;
//	  if (instance_exists(exclamation_instance)) {
//            instance_destroy(exclamation_instance);
//            exclamation_instance = noone;
//        }
//	 image_speed = 0; // Pause the animation
//        image_index = 0; // Reset to the first frame
//}