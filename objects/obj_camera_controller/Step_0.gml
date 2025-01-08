// Step Event
// Update camera position (example: following player)
if (instance_exists(obj_Player)) {
    var target_x = obj_Player.x - window_get_width()/2;
    var target_y = obj_Player.y - window_get_height()/2;
    
    x = lerp(x, target_x, 0.1);
    y = lerp(y, target_y, 0.1);
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);
