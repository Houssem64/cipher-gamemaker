Rectanglex1 = x 
Rectangley1 = y +20
Rectanglex2 = x + 15;
Rectangley2 = y +50;

popup_id = instance_create_layer(x, y+17, "Effects", obj_E_key);

popup_id.visible = false;
has_been_opened = false;
// Stop the animation and show first frame
image_speed = 0;
image_index = 0;
global.door_solid = true;  // Global variable to track door state
global.openable = false
show_debug_message(global.openable)
mask_index = sprite_index;

