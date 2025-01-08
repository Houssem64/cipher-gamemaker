// Draw GUI Event
// This is where we apply the shader to the application surface
if (!surface_exists(surf)) {
    surf = surface_create(window_get_width(), window_get_height());
}

surface_set_target(surf);
draw_clear_alpha(c_black, 0);

shader_set(shader);
shader_set_uniform_f(u_time, current_time / 1000.0);
shader_set_uniform_f(u_resolution, window_get_width(), window_get_height());

draw_surface(application_surface, 0, 0);

shader_reset();
surface_reset_target();

// Draw the processed surface
draw_surface(surf, 0, 0);