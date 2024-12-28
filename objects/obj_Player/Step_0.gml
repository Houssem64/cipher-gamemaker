var right_key = keyboard_check(vk_right);
var left_key = keyboard_check(vk_left);
var  up_key = keyboard_check(vk_up);
var  down_key = keyboard_check(vk_down);

//movement direction
xspeed = (right_key - left_key) * move_speed;
yspeed = (down_key - up_key) * move_speed;
//set sprite

mask_index = sprite[DOWN]
if yspeed == 0 {
if xspeed > 0 {face = RIGHT };
if xspeed < 0 {face = LEFT };
}
if xspeed > 0 and face ==LEFT {face = RIGHT}
if xspeed < 0 and face ==RIGHT {face = LEFT}


if xspeed = 0 {
if yspeed > 0 {face = DOWN };
if yspeed < 0 {face = UP };
}
if yspeed > 0 and face ==UP {face = DOWN}
if yspeed < 0 and face ==DOWN {face = UP}
if xspeed == 0 and yspeed = 0 {
	face = IDLE}
sprite_index = sprite[face]
//colission 
// Check for walls and closed doors
if place_meeting(x+xspeed, y, obj_wall) || (global.door_solid && place_meeting(x+xspeed, y, obj_door))
{
    xspeed = 0;
}
if place_meeting(x, y+yspeed, obj_wall) || (global.door_solid && place_meeting(x, y+yspeed, obj_door))
{
    yspeed = 0;
}



//move the player
x += xspeed; 
y+= yspeed;

//depth 
depth = -bbox_bottom



if (place_meeting(x, y, obj_computer) && keyboard_check_pressed(vk_space)) {
    with (obj_computer) {
        terminal_open = true; // Open terminal when space is pressed
    }
}











