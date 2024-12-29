var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var  up_key = keyboard_check(vk_up);
var  down_key = keyboard_check(vk_down);

//movement direction
global.xspeed = (right_key - left_key) * move_speed;
global.yspeed = (down_key - up_key) * move_speed;
//set sprite

mask_index = sprite[DOWN]
if global.yspeed == 0 {
if global.xspeed > 0 {face = RIGHT };
if global.xspeed < 0 {face = LEFT };
}
if global.xspeed > 0 and face ==LEFT {face = RIGHT}
if global.xspeed < 0 and face ==RIGHT {face = LEFT}


if global.xspeed = 0 {
if global.yspeed > 0 {face = DOWN };
if global.yspeed < 0 {face = UP };
}
if global.yspeed > 0 and face ==UP {face = DOWN}
if global.yspeed < 0 and face ==DOWN {face = UP}
if global.xspeed == 0 and global.yspeed = 0 {
	face = IDLE}
sprite_index = sprite[face]
//colission 


// Check for walls and closed doors
if (place_meeting(x+global.xspeed, y, obj_wall) || 
    (variable_global_exists("door_solid") && global.door_solid && place_meeting(x+global.xspeed, y, obj_door)))
{
    global.xspeed = 0;
}
if (place_meeting(x, y+global.yspeed, obj_wall) || 
    (variable_global_exists("door_solid") && global.door_solid && place_meeting(x, y+global.yspeed, obj_door)))
{
    global.yspeed = 0;
}



//move the player
x += global.xspeed; 
y+= global.yspeed;

//depth 
depth = -bbox_bottom



if (place_meeting(x, y, obj_computer) && keyboard_check_pressed(vk_space)) {
    with (obj_computer) {
        terminal_open = true; // Open terminal when space is pressed
    }
}











