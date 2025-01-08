#macro view view_camera[0]
camera_set_view_size(view, view_width, view_height);

// Step Event
if (instance_exists(obj_Player)) {
    var _x = obj_Player.x - view_width/2;
    var _y = obj_Player.y - view_height/2;
    
    // Optional: Add camera bounds to keep within room
    _x = clamp(_x, 0, room_width - view_width);
    _y = clamp(_y, 0, room_height - view_height);
    
    camera_set_view_pos(view, _x, _y);
}
