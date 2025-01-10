
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);


var _x = cam_x + (cam_width - keypad_width) / 2;
var _y = cam_y + (cam_height - keypad_height) / 2;
if(!has_been_interacted) {
    if(collision_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, obj_Player, false, true)) {
        popup_id.visible = true;
		
      

        if(keyboard_check_pressed(ord("E"))) {
           
			instance_create_layer(_x,_y,"Effects",obj_keypad_interactable)

        }
		  if(keyboard_check_pressed(vk_escape)) {
           
			instance_destroy(obj_keypad_interactable)

        }
    } else {
        popup_id.visible = false;
		instance_destroy(obj_keypad_interactable)
    }
}
