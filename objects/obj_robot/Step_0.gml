if (!instance_exists(obj_Player)) exit;

var player = obj_Player;
var prev_x = x;
var prev_y = y;

// Check if player is in sight
var can_see_player = false;
var dist_to_player = point_distance(x, y, player.x, player.y);
var dir_to_player = point_direction(x, y, player.x, player.y);

if (dist_to_player <= detection_range) {
    if (!collision_line(x, y, player.x, player.y, obj_wall, false, true)) {
        can_see_player = true;
    }
}

switch(state) {
    case RobotState.PATROL:
        // Get current target point
        var target = patrol_points[current_point];
        var dist_to_point = point_distance(x, y, target.x, target.y);
        
        show_debug_message("Moving to point " + string(current_point) + 
                          " at " + string(target.x) + ", " + string(target.y) + 
                          " Distance: " + string(dist_to_point));
        
        if (dist_to_point > point_threshold) {
            // Move towards point
            var move_dir = point_direction(x, y, target.x, target.y);
            x += lengthdir_x(spd, move_dir);
            y += lengthdir_y(spd, move_dir);
        } else {
            // Point reached, move to next
            current_point = (current_point + 1) % array_length(patrol_points);
            show_debug_message("Reached point. Moving to next point: " + string(current_point));
        }
        
        // Check for player detection
        if (can_see_player) {
            state = RobotState.ALERT;
            show_debug_message("Player detected! Switching to ALERT");
        }
        break;
        
    case RobotState.ALERT:
	  xspd =lengthdir_x(spd,dir_to_player)
	  yspd = lengthdir_y(spd, dir_to_player)
		  	  x+=xspd
			 y+= yspd
	  if (place_meeting(x,y,obj_wall)) {

}
        if (!can_see_player) {
            detection_timer++;
            if (detection_timer > room_speed * 2) {
                state = RobotState.PATROL;
                detection_timer = 0;
                show_debug_message("Lost player. Returning to PATROL");
            }
        } else {
            detection_timer = 0;
            
            // Shoot at intervals
            //if ((detection_timer mod shoot_delay) == 0) {
            //    var proj = instance_create_layer(x, y, "Instances", obj_projectile);
            //    proj.direction = dir_to_player;
            //    proj.speed = projectile_speed;
            //    show_debug_message("Shooting at player");
            //}
        }
        break;
}

// Update sprite based on movement
var x_diff = x - prev_x;
var y_diff = y - prev_y;

if (abs(x_diff) > 0.1 || abs(y_diff) > 0.1) {
    // Moving
    if (abs(x_diff) > abs(y_diff)) {
        sprite_index = x_diff > 0 ? spr_robot_right : spr_robot_left;
    } else {
        sprite_index = y_diff > 0 ? spr_robot_down : spr_robot_up;
    }
} else if (state == RobotState.ALERT) {
    // Not moving but alert - face player
    if (dir_to_player >= 315 || dir_to_player < 45) sprite_index = spr_robot_right;
    else if (dir_to_player >= 45 && dir_to_player < 135) sprite_index = spr_robot_up;
    else if (dir_to_player >= 135 && dir_to_player < 225) sprite_index = spr_robot_left;
    else sprite_index = spr_robot_down;
} else {
    sprite_index = spr_robot_idle;
}