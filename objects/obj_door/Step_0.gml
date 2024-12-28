// Door collision bounds
var x1 = x;
var y1 = y + 20;
var x2 = x + 10;
var y2 = y + 10;

// Handle door state when closed
if (!has_been_opened) {
    image_speed = 0;
    image_index = 0;
    global.door_solid = true;  // Door is solid while closed

    // Check if the player presses "E" and the door is not openable
    if (!global.openable && keyboard_check_pressed(ord("E"))) {
        var dialog = instance_create_layer(0, 0, "Instances", obj_dialog_manager);
        dialog.start_dialog(["Complete all missions to unlock the door."]);
        dialog.callback_object = id;
    }

    // Handle collision with player for popup visibility
    if (!collision_rectangle(Rectanglex1, Rectangley1,Rectanglex2, Rectangley2, obj_Player, false, true)) {
        popup_id.visible = false;
    } else {
        popup_id.visible = true;
        // Check if the player presses "E" and the door is openable
        if (keyboard_check_pressed(ord("E")) && global.openable) {
            has_been_opened = true;
            image_speed = 1;
            global.door_solid = false;  // Door becomes passable when opening
            popup_id.visible = false;
        }
    }
}

// Handle room transition when player collides with door bounds
if (collision_rectangle(x1, y1, x2, y2, obj_Player, true, false)) {
    room_goto(Level1);
}

// Stop animation when the door finishes opening
if (image_speed > 0 && image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1;
}