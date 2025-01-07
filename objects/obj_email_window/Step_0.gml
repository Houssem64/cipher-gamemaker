// Step Event of obj_email_window
event_inherited();

// Handle mouse input
if (mouse_check_button_pressed(mb_left)) {
    var content_start_y = y + 30;
    var left_panel_width = width * 0.35;
    
    // Check compose button
    if (point_in_rectangle(mouse_x, mouse_y,
        x + 10, content_start_y + 5,
        x + left_panel_width - 10, content_start_y + 35)) {
        composing_email = true;
        selected_email = -1;
        new_email = {
            to: "",
            subject: "",
            body: ""
        };
        keyboard_string = "";
    }
    
    // Check if sending email
    if (composing_email) {
        if (point_in_rectangle(mouse_x, mouse_y,
            x + width - 100, y + height - 40,
            x + width - 20, y + height - 10)) {
            // Add the new email to the list
            if (new_email.to != "" && new_email.subject != "") {
                array_insert(emails, 0, {
                    subject: new_email.subject,
                    sender: "me@email.com", // You could make this configurable
                    date: current_date_string(),
                    body: new_email.body
                });
                composing_email = false;
            }
        }
        
        // Check input fields
        var content_x = x + left_panel_width + 10;
        var content_y = content_start_y + 10;
        
        if (point_in_rectangle(mouse_x, mouse_y,
            content_x + 50, content_y - 5,
            x + width - 20, content_y + 15)) {
            keyboard_string = new_email.to;
            global.selected_field = "to";
        } else if (point_in_rectangle(mouse_x, mouse_y,
            content_x + 70, content_y + 25,
            x + width - 20, content_y + 45)) {
            keyboard_string = new_email.subject;
            global.selected_field = "subject";
        } else if (point_in_rectangle(mouse_x, mouse_y,
            content_x, content_y + 60,
            x + width - 20, y + height - 50)) {
            keyboard_string = new_email.body;
            global.selected_field = "body";
        } else {
            global.selected_field = "";
        }
    } else {
        // Check email list
        var list_start_y = content_start_y + 45;
        if (point_in_rectangle(mouse_x, mouse_y,
            x, list_start_y,
            x + left_panel_width, y + height)) {
            var click_y = mouse_y - list_start_y;
            var email_index = floor(click_y / 60);
            
            if (email_index >= 0 && email_index < array_length(emails)) {
                selected_email = email_index;
                composing_email = false;
            }
        }
    }
}

// Handle keyboard input for compose form
if (composing_email && global.selected_field != "") {
    if (keyboard_check_pressed(vk_backspace) && string_length(keyboard_string) > 0) {
        keyboard_string = string_delete(keyboard_string, string_length(keyboard_string), 1);
    }
    
    switch(global.selected_field) {
        case "to":
            new_email.to = keyboard_string;
            break;
        case "subject":
            new_email.subject = keyboard_string;
            break;
        case "body":
            new_email.body = keyboard_string;
            break;
    }
}

// Helper function to get current date as string
function current_date_string() {
    return string(current_year) + "-" + 
           string(current_month) + "-" + 
           string(current_day);
}