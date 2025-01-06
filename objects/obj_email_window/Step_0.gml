event_inherited();

// Handle email selection
if (mouse_check_button_pressed(mb_left)) {
    var content_start_y = y + 30;
    var left_panel_width = width * 0.35;
    
    // Check if click is in left panel
    if (point_in_rectangle(mouse_x, mouse_y, 
                          x, content_start_y, 
                          x + left_panel_width, y + height)) {
        // Calculate which email was clicked
        var click_y = mouse_y - content_start_y;
        var email_index = floor(click_y / 60);
        
        if (email_index >= 0 && email_index < array_length(emails)) {
            selected_email = email_index;
        }
    }
}