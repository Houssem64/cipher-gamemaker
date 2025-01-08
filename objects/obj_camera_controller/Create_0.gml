// Create Event
view_enabled = true;
view_visible[0] = true;

// Set up the application surface to match window size
surface_resize(application_surface, window_get_width(), window_get_height());

// Camera setup
camera = camera_create();
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(window_get_width(), window_get_height(), 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;

// Create the surface we'll render to
surf = -1;
shader = sdr_camera; // Your shader asset name
u_time = shader_get_uniform(shader, "time");
u_resolution = shader_get_uniform(shader, "resolution");