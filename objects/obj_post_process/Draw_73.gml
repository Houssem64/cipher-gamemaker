// Draw End Event
// This runs after all other game drawing
if (surface_exists(surf)) {
    // Copy the application surface to our surface
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    draw_surface(application_surface, 0, 0);
    surface_reset_target();
    
    // Draw the surface with our shader applied
    gpu_set_blendmode(bm_normal);
    shader_set(shader);
    
    // Set shader uniforms
    shader_set_uniform_f(u_time, current_time/1000);
    shader_set_uniform_f(u_resolution, surface_width, surface_height);
    
    // Draw the processed surface
    draw_surface(surf, 0, 0);
    
    shader_reset();
}