event_inherited();

// Calculate panel dimensions
var left_panel_width = width * 0.35;
var right_panel_width = width * 0.65;
var content_start_y = y + 30;
var panel_height = height - 30;

// Draw "Compose" button
draw_set_color(c_blue);
draw_rectangle(x + 10, content_start_y + 5, x + left_panel_width - 10, content_start_y + 35, false);
draw_set_color(c_white);
draw_text(x + 20, content_start_y + 15, "Compose Email");

// Draw panel separation line
draw_set_color(c_gray);
draw_line(x + left_panel_width, content_start_y, x + left_panel_width, y + height);

// Draw left panel (email list)
draw_set_color(c_black);
var list_start_y = content_start_y + 45; // Start below compose button
for (var i = 0; i < array_length(emails); i++) {
    var email = emails[i];
    var email_y = list_start_y + (i * 60);
    
    if (i == selected_email) {
        draw_set_color(c_ltgray);
        draw_rectangle(x, email_y+5, x + left_panel_width - 1, email_y + 65, false);
        draw_set_color(c_black);
    }
    
    draw_text(x + 10, email_y + 5, string_hash_to_newline(email.sender));
    draw_set_color(c_gray);
    draw_text(x + 10, email_y + 25, string_hash_to_newline(email.date));
    draw_set_color(c_black);
    
    var truncated_subject = string_copy(email.subject, 1, 30);
    if (string_length(email.subject) > 30) truncated_subject += "...";
    draw_text(x + 10, email_y + 45, string_hash_to_newline(truncated_subject));
}

// Draw right panel (compose or view email)
if (composing_email) {
    var content_x = x + left_panel_width + 10;
    var content_y = content_start_y + 10;
    
    // Draw input fields
    draw_set_color(c_black);
    draw_text(content_x, content_y, "To:");
    draw_rectangle(content_x + 50, content_y - 5, x + width - 20, content_y + 15, true);
    draw_text(content_x + 55, content_y, new_email.to);
    
    draw_text(content_x, content_y + 30, "Subject:");
    draw_rectangle(content_x + 70, content_y + 25, x + width - 20, content_y + 45, true);
    draw_text(content_x + 75, content_y + 30, new_email.subject);
    
    // Message body
    draw_rectangle(content_x, content_y + 60, x + width - 20, y + height - 50, true);
    draw_text_ext(content_x + 5, content_y + 65, new_email.body, 20, right_panel_width - 40);
    
    // Send button
    draw_set_color(c_green);
    draw_rectangle(x + width - 100, y + height - 40, x + width - 20, y + height - 10, false);
    draw_set_color(c_white);
    draw_text(x + width - 80, y + height - 32, "Send");
} else if (selected_email != -1) {
    var email = emails[selected_email];
    var content_x = x + left_panel_width + 10;
    var content_y = content_start_y + 10;
    
    draw_set_color(c_black);
    draw_text(content_x, content_y, "From: " + email.sender);
    draw_text(content_x, content_y + 20, "Date: " + email.date);
    draw_text(content_x, content_y + 40, "Subject: " + email.subject);
    
    draw_set_color(c_gray);
    draw_line(content_x, content_y + 70, x + width - 10, content_y + 70);
    
    draw_set_color(c_black);
    draw_text_ext(content_x, content_y + 90, email.body, 20, right_panel_width - 20);
}
