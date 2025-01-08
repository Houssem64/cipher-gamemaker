// State machine logic
switch (state) {
    case GuardState.PATROLLING:
        // Patrol along the path
        if (path_position == 1) {
            path_start(path, speed, path_action_continue, true); // Restart the path
        }

        // Check for the player
        var player =  obj_Player; // Replace with your player object
        var angle_to_player = point_direction(x, y, player.x, player.y);

        if (point_distance(x, y, player.x, player.y) <= detection_range &&
            abs(angle_difference(direction, angle_to_player)) <= detection_angle / 2) {
            // Player is in the detection cone
            detection_timer++;
            if (detection_timer >= 30) { // 1 second (60 frames)
                state = GuardState.ALERT; // Switch to alert state
                detection_timer = 0;
            }
        } else {
            detection_timer = 0;
        }
        break;

   case GuardState.ALERT:
    // Stop moving and look around
    path_end(); // Stop following the path
    direction += 5; // Rotate slowly (look around)

    // Check if the player is still in sight
  

    if (point_distance(x, y, player.x, player.y) <= detection_range &&
        abs(angle_difference(direction, angle_to_player)) <= detection_angle / 2) {
        // Player is still in sight
        detection_timer++;
        if (detection_timer >= 30) { // 0.5 seconds (30 frames)
            state = GuardState.CHASING; // Switch to chasing state
            detection_timer = 0;
        }
    } else {
        // Player is no longer in sight
        state = GuardState.PATROLLING; // Return to patrolling state
        path_start(path, speed, path_action_restart, true); // Resume patrolling
    }
    break;

  case GuardState.CHASING:
    // Chase the player
 
    direction = point_direction(x, y, player.x, player.y);
    speed = 4; // Move faster when chasing
    x += lengthdir_x(speed, direction);
    y += lengthdir_y(speed, direction);

    // Check if the player is caught
    if (place_meeting(x, y, obj_player)) {
        // Player is caught
        show_debug_message("Player caught!");
        // Add logic for what happens when the player is caught (e.g., game over)
    }

    // Optional: Return to patrolling if the player escapes
    if (point_distance(x, y, player.x, player.y) > detection_range * 2) {
        state = GuardState.PATROLLING; // Return to patrolling state
        path_start(path, speed, path_action_restart, true); // Resume patrolling
    }
    break;
}










//// Calculate the angle to the player
//var player = obj_Player; // Replace with your player object
//var angle_to_player = point_direction(x, y, player.x, player.y);

//// Check if the player is within the detection range and angle
//if (point_distance(x, y, player.x, player.y) <= detection_range &&
//    abs(angle_difference(direction, angle_to_player)) <= detection_angle / 2) {
//    // Player is in the detection cone
//    if (!player_spotted) {
//        player_spotted = true;
//        detection_timer = 0;
//    } else {
//        detection_timer++;
//        if (detection_timer >= 60) { // 1 second (60 frames)
//            // Trigger the alarm
//            if (!audio_is_playing(alarm_sound)) {
//                audio_play_sound(alarm_sound, 0, false);
//            }
//        }
//    }
//} else {
//    // Player is not in the detection cone
//    player_spotted = false;
//    detection_timer = 0;
//}