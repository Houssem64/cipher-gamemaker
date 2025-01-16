function draw_app() {
    var screen_x = phone.layout.screen.x;
    var screen_y = phone.layout.screen.y;
    
    // Draw header
    draw_set_color(c_black);
    draw_rectangle(screen_x, screen_y, 
                   screen_x + phone.layout.screen.width, 
                   screen_y + phone.status_height, false);
    draw_set_color(c_white);
    draw_text(screen_x + 20, screen_y + 10, app_name);
    
    // Draw messages
    draw_messages();
}

// Function to draw messages
function draw_messages() {
    var screen_x = phone.layout.screen.x;
    var screen_y = phone.layout.screen.y;
    
    // Draw messages
    var messageY = screen_y + phone.status_height + 10 + scroll_y; // Start below header
    for (var i = 0; i < array_length(messages); i++) {
        var msg = messages[i];
        
        // Draw message background
        draw_set_color(c_dkgray);
        draw_rectangle(screen_x + 10, messageY, 
                       screen_x + phone.layout.screen.width - 10, 
                       messageY + 40, false);
        
        // Draw message content
        draw_set_color(c_white);
        draw_text(screen_x + 20, messageY + 5, msg.sender);
        draw_text(screen_x + 20, messageY + 25, msg.content);
        
        messageY += 50; // Move down for the next message
    }
}