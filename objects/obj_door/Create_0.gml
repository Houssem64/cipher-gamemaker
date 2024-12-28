Rectanglex1 = x 
Rectangley1 = y -10
Rectanglex2 = x + 15;
Rectangley2 = y +50;
popup_id = instance_create_layer(x, y+25, "Effects", obj_promptkey);

popup_id.visible = false;
has_been_opened = false;
// Stop the animation and show first frame
image_speed = 0;
image_index = 0;
global.door_solid = true;  // Global variable to track door state
mask_index = sprite_index;