////// Call the parent Global Left Pressed Event (handles close button, fit-to-screen button, dragging, etc.)
////event_inherited();

////// Check if an email is clicked
////for (var i = 0; i < array_length(emails); i++) {
////    var email_y = y + 30 + i * 20; // Position of each email in the list
////    if (mouse_x >= x + 10 && mouse_x <= x + width - 10 &&
////        mouse_y >= email_y - 2 && mouse_y <= email_y + 18) {
////        selected_email = i; // Select the clicked email
////        break;
////    }
////}

//// Modified Email Window Mouse Event (obj_email_window)
//event_inherited();

//    for (var i = 0; i < array_length(emails); i++) {
//        var email_y = y + 30 + i * 20;
//        if (mouse_x >= x + 10 && mouse_x <= x + width - 10 &&
//            mouse_y >= email_y - 2 && mouse_y <= email_y + 18) {
//            var email_window = instance_create_depth(x + 10, y + 10, depth - 1, obj_email_content_window);
//            email_window.window_title = "Email: " + emails[i].subject;
//            email_window.email_content = "From: " + emails[i].sender + "\n\n" + emails[i].body;
            
//            // Get the window manager instance
//            var manager = instance_nearest(0, 0, obj_window_manager);
//            if (manager != noone) {
//                email_window.depth = manager.next_depth;
//                manager.next_depth -= 1;
//            }
//            break;
//        }
//    }
