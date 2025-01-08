//if (!instance_exists(obj_Player)) exit;

//var player = obj_Player;
//var angle_to_player = point_direction(x, y, player.x, player.y);
//var distance_to_player = point_distance(x, y, player.x, player.y);
//var can_see_player = false;

//// Line of sight check
//if (distance_to_player <= detection_range &&
//    abs(angle_difference(direction, angle_to_player)) <= detection_angle / 2) {
//    // Check for walls blocking view
//    var wall_check = collision_line(x, y, player.x, player.y, obj_wall, false, true);
//    can_see_player = (wall_check == noone);
//}

//switch (state) {
//    case GuardState.PATROLLING:
//        // Maintain patrol speed
//        path_speed = patrol_speed;
        
//        // Check for player detection
//        if (can_see_player) {
//            detection_timer++;
//            if (detection_timer >= room_speed/2) { // Half second detection time
//                state = GuardState.ALERT;
//                path_end();
//                detection_timer = 0;
//                audio_play_sound(alarm_sound, 1, false);
//            }
//        } else {
//            detection_timer = 0;
//        }
//        break;

//    case GuardState.ALERT:
//        // Rotate to scan the area
//        //direction += alert_rotation_speed;
        
//        if (can_see_player) {
//            detection_timer++;
//            if (detection_timer >= room_speed/3) {
             
//                detection_timer = 0;
//            }
//        } else {
//            detection_timer++;
//            if (detection_timer >= room_speed * 2) { // Return to patrol after 2 seconds
//                state = GuardState.PATROLLING;
//                path_start(path, patrol_speed, path_action_restart, true);
//                detection_timer = 0;
//            }
//        }
//        break;

  
//}


if (!instance_exists(obj_Player)) exit;

var player = obj_Player;
var angle_to_player = point_direction(x, y, player.x, player.y);
var distance_to_player = point_distance(x, y, player.x, player.y);
var can_see_player = false;

// Line of sight check
if (distance_to_player <= detection_range &&
    abs(angle_difference(direction, angle_to_player)) <= detection_angle / 2) {
    // Check for walls blocking view
    var wall_check = collision_line(x, y, player.x, player.y, obj_wall, false, true);
    can_see_player = (wall_check == noone);
}

switch (state) {
    case GuardState.PATROLLING:
        // Maintain patrol speed
        path_speed = patrol_speed;
        
        // Check for player detection
        if (can_see_player) {
            detection_timer++;
            if (detection_timer >= room_speed / 2) { // Half second detection time
                state = GuardState.ALERT;
                path_end();
                detection_timer = 0;
                audio_play_sound(alarm_sound, 1, false); // Sound the alarm
            }
        } else {
            detection_timer = 0;
        }
        break;

    case GuardState.ALERT:
        // Rotate to face the player
        direction = angle_to_player;

        if (can_see_player) {
            detection_timer++;
            if (detection_timer >= room_speed / 3) { // Shoot every 1/3 second
                // Create a projectile aimed at the player
                var projectile = instance_create_layer(x, y, "Projectiles", obj_projectile);
                projectile.direction = angle_to_player;
                projectile.speed = projectile_speed;
                detection_timer = 0;
            }
        } else {
            detection_timer++;
            if (detection_timer >= room_speed * 2) { // Return to patrol after 2 seconds
                state = GuardState.PATROLLING;
                path_start(path, patrol_speed, path_action_restart, true);
                detection_timer = 0;
            }
        }
        break;
}
