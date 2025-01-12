// Update position relative to camera
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);

// Position more to the right
x = cam_x + cam_width - (sprite_get_width(spr_ai_companion) * 0.07 + 170);  // Adjusted for smaller size
y = cam_y + 10;  // Small top margin

// Message handling
if (is_talking) {
    char_index += char_speed;
    if (char_index >= string_length(current_message)) {
        char_index = string_length(current_message);
        if (!alarm[0]) alarm[0] = room_speed * 3;
    }
} else if (!ds_queue_empty(message_queue) && !is_talking) {
    current_message = ds_queue_dequeue(message_queue);
    is_talking = true;
    char_index = 0;
}