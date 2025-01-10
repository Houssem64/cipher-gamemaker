has_been_opened = false;
openable = false;
popup_id = instance_create_layer(x + 8, y, "Effects", obj_E_key);
popup_id.visible = false;

// Create collision object
door_collision = instance_create_layer(x, y, "collider", obj_door_collision);
door_collision.image_xscale = sprite_width / door_collision.sprite_width;
door_collision.image_yscale = sprite_height / door_collision.sprite_height;

// Initialize door interaction bounds
Rectanglex1 = x;
Rectangley1 = y +20 ;
Rectanglex2 = x + 35;
Rectangley2 = y + 50;

image_speed = 0;
image_index = 0;




mask_index = sprite_index;
