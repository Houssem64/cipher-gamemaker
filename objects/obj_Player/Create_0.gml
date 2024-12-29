global.xspeed = 0;
global.yspeed = 0;
if (!variable_global_exists("door_solid")) {
    global.door_solid = true;  // Fallback initialization
}


move_speed = 1.5;

sprite[0] = spr_Player_right;
sprite[1] = spr_Player_up
sprite[2] = spr_Player_left
sprite[3] = spr_Player_down
sprite[4] = spr_Player_idle

face = IDLE;
