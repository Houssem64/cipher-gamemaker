event_inherited();

// Calculate panel dimensions
var left_panel_width = width * 0.35;  // 35% of window width
var right_panel_width = width * 0.65; // 65% of window width
var content_start_y = y + 30;         // Start below title bar
var panel_height = height - 30;       // Full height minus title bar

// Draw panel separation line
draw_set_color(c_gray);
draw_line(x + left_panel_width, content_start_y, 
          x + left_panel_width, y + height);

// Draw left panel (email list)
draw_set_color(c_black);
for (var i = 0; i < array_length(emails); i++) {
    var email = emails[i];
    var email_y = content_start_y + (i * 60);
    
    // Highlight selected email
    if (i == selected_email) {
        draw_set_color(c_ltgray);
        draw_rectangle(x, email_y+5, x + left_panel_width - 1, email_y + 65, false);
        draw_set_color(c_black);
    }
    
    // Draw email preview
    draw_set_font(-1); // Reset to default font
    draw_text(x + 10, email_y + 5, string_hash_to_newline(email.sender));
    draw_set_color(c_gray);
    draw_text(x + 10, email_y + 25, string_hash_to_newline(email.date));
    draw_set_color(c_black);
    
    // Draw truncated subject
    var truncated_subject = string_copy(email.subject, 1, 30);
    if (string_length(email.subject) > 30) truncated_subject += "...";
    draw_text(x + 10, email_y + 45, string_hash_to_newline(truncated_subject));
}

// Draw right panel (email content)
if (selected_email != -1) {
    var email = emails[selected_email];
    var content_x = x + left_panel_width + 10;
    var content_y = content_start_y + 10;
    
    // Draw email header
    draw_set_color(c_black);
    draw_text(content_x, content_y, "From: " + email.sender);
    draw_text(content_x, content_y + 20, "Date: " + email.date);
    draw_text(content_x, content_y + 40, "Subject: " + email.subject);
    
    // Draw separator line
    draw_set_color(c_gray);
    draw_line(content_x, content_y + 70, 
              x + width - 10, content_y + 70);
    
    // Draw email body with word wrap
    draw_set_color(c_black);
    draw_text_ext(content_x, content_y + 90, 
                 email.body,
                 20, // Line height
                 right_panel_width - 20); // Max width
}
