if (paused) {
    // Draw semi-transparent background
  
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
   
    
    // Draw menu title
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(fnt_monospace); // Replace with your font
    draw_text(menu_x, menu_y - 100, "PAUSED");
    
    // Draw menu options
    for (var i = 0; i < array_length(menu_options); i++) {
        var y_pos = menu_y + (i * option_height);
        
        if (i == selected_option) {
            draw_set_color(c_lime);
            // Draw selector arrows
            draw_text(menu_x - 100, y_pos, ">");
            draw_text(menu_x + 100, y_pos, "<");
        } else {
            draw_set_color(c_white);
        }
        
        draw_text(menu_x, y_pos, menu_options[i]);
    }
}