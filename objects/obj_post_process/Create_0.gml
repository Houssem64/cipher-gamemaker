// Create Event
layer_name = "PostProcess";

// Create the layer above the game layers
if (!layer_exists(layer_name)) {
    layer_create(layer_get_depth("Instances") - 100, layer_name);
}

// Create a surface to render to
surf = -1;
surface_width = room_width+500;
surface_height = room_height+500;

// Get shader uniform locations
shader = sdr_camera;  // Your shader asset name
u_time = shader_get_uniform(shader, "time");
u_resolution = shader_get_uniform(shader, "resolution");