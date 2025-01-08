// Activating the shader
bktglitch_activate();

// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);

// Additional tweaking

bktglitch_set_intensity(1.000000);
bktglitch_set_line_shift(0.004000);
bktglitch_set_line_speed(0.010000);
bktglitch_set_line_resolution(1.000000);
bktglitch_set_line_drift(0.100000);
bktglitch_set_line_vertical_shift(0.000000);
bktglitch_set_noise_level(0.500000);
bktglitch_set_jumbleness(0.200000);
bktglitch_set_jumble_speed(1.000000);
bktglitch_set_jumble_resolution(0.200000);
bktglitch_set_jumble_shift(0.150000);
bktglitch_set_channel_shift(0.004000);
bktglitch_set_channel_dispersion(0.002500);
bktglitch_set_shakiness(0.500000);
bktglitch_set_rng_seed(0.000000);
////// Alternatively:
bktglitch_config(0.004000, 0.010000, 1.000000, 0.100000, 0.000000, 0.200000, 1.000000, 0.200000, 0.150000, 0.500000, 0.004000, 0.002500, 0.500000, 1.000000, 0.000000);

// Setting the overall intensity of the effect, adding a bit when the ball bounces.
bktglitch_set_intensity(0.5 );

// Drawing the application surface
draw_surface(application_surface, 0, 0);

// Done with the shader (this is really just shader_reset)!
bktglitch_deactivate();
draw_set_font(fnt_monospace)
draw_set_alpha(alpha); // Set the alpha value for drawing
draw_text(room_width / 2, room_height / 2, "PRESS A KEY TO START");
draw_set_alpha(1); // Reset alpha to 1 for other drawing operations