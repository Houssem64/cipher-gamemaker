
var x1 = x
var y1 = y+20
var x2 = x+30
var y2 = y+10

var player_in_range = collision_rectangle(
    Rectanglex1, 
    Rectangley1, 
    Rectanglex2, 
    Rectangley2, 
    obj_Player, 
    false, 
    true
);

// Update popup visibility and handle interaction
if (!player_in_range) {
    popup_id.visible = false;
} else {
    popup_id.visible = true;
    
    // Handle door opening when E is pressed and door is openable
    if (keyboard_check_pressed(ord("E")) && openable) {
        has_been_opened = true;
        image_speed = 1;
        instance_destroy(door_collision);  // Destroy collision object when door opens
        popup_id.visible = false;
    }
}

// Handle room transition when player collides with door bounds
if (has_been_opened && collision_rectangle(x1, y1, x2,y2, obj_Player, true, false)) {
    room_goto(Level1);
}

// Stop animation when the door finishes opening
if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
}