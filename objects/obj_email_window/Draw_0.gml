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
// Add this to your Draw Event where you draw the email content
if (selected_email >= 0 && !composing_email) {
    var button_y = y + 35;
    
    // Draw delete button with hover effect
    draw_set_color(delete_button_hover ? c_maroon : c_red);
    draw_rectangle(
        x + width - 90,
        button_y,
        x + width - 20,
        button_y + 25,
        false
    );
    
    // Draw button text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(
        x + width - 55,
        button_y + 5,
        "Delete"
    );
    draw_set_halign(fa_left);
    
    // Draw confirmation dialog if active
    if (showing_delete_confirm) {
        // Semi-transparent background overlay
        draw_set_alpha(0.5);
        draw_set_color(c_black);
        draw_rectangle(x, y, x + width, y + height, false);
        draw_set_alpha(1);
        
        // Dialog box
        var dialog_width = 400;
        var dialog_height = 150;
        var dialog_x = x + (width - dialog_width) / 2;
        var dialog_y = y + (height - dialog_height) / 2 ;
        
        // Dialog background
        draw_set_color(c_white);
        draw_rectangle(dialog_x, dialog_y, dialog_x + dialog_width, dialog_y + dialog_height, false);
        draw_set_color(c_black);
        draw_rectangle(dialog_x, dialog_y, dialog_x + dialog_width, dialog_y + dialog_height, true);
        
        // Dialog title
        draw_set_halign(fa_center);
        draw_text(dialog_x + dialog_width/2, dialog_y + 20, "Confirm Delete");
        
        // Dialog message
        draw_text(dialog_x + dialog_width/2, dialog_y + 60, "Are you sure you want to delete this email?");
        
        // Yes button
        var button_width = 80;
        var button_height = 30;
        var yes_x = dialog_x + dialog_width/2 - button_width - 10;
        var no_x = dialog_x + dialog_width/2 + 10;
        var buttons_y = dialog_y + dialog_height - 50;
        
        draw_set_color(c_red);
        draw_rectangle(yes_x, buttons_y, yes_x + button_width, buttons_y + button_height, false);
        draw_set_color(c_white);
		
        draw_text(yes_x + button_width/2, buttons_y + button_height/2-10, "Yes");
        
        // No button
        draw_set_color(c_gray);
        draw_rectangle(no_x, buttons_y, no_x + button_width, buttons_y + button_height, false);
        draw_set_color(c_white);
        draw_text(no_x + button_width/2, buttons_y + button_height/2-10, "No");
        
        draw_set_halign(fa_left);
    }
}
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
