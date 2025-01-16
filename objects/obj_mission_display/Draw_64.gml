//draw_set_font(font2);



//if (visible) {
//    // Mission box dimensions
//    var box_width = 200;
//    var box_height = 100;
//    var margin = 20;
    
//    // Position in top right
//    var box_x1 = view_wport[0] - box_width - margin;
//    var box_x2 = view_wport[0] - margin;
//    var box_y1 = margin;
//    var box_y2 = box_y1 + box_height;
    
//    // Draw main background
//    draw_set_color(c_lime);
//    draw_set_alpha(0.8);
//    draw_rectangle(box_x1, box_y1, box_x2, box_y2, true);
//	  draw_set_color(c_black);
//	draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);
//    draw_set_alpha(1);
    
//    // Draw title
//    draw_set_color(c_lime);
//    draw_set_halign(fa_left);
//    draw_set_valign(fa_top);
//    draw_text(box_x1 + 10, box_y1 + 10, "CURRENT MISSION:");
    
//    with(obj_mission_manager) {
//        if (ds_list_size(global.active_missions) > 0) {
//            var mission = global.active_missions[|0];
            
//            // Draw mission title
//            draw_set_color(c_lime);
//            draw_text(box_x1 + 10, box_y1 + 30, mission.title);
            
//            // Draw current objective
//            for(var j = 0; j < array_length(mission.objectives); j++) {
//                if (mission.progress[j] < mission.required[j]) {
//                    // Draw progress bar
//                    var bar_width = 180;
//                    var progress = mission.progress[j] / mission.required[j];
//                    draw_set_color(c_dkgray);
//                    draw_rectangle(box_x1 + 10, box_y1 + 70, box_x1 + 10 + bar_width, box_y1 + 76, false);
//                    draw_set_color(c_lime);
//                    draw_rectangle(box_x1 + 10, box_y1 + 70, box_x1 + 10 + (bar_width * progress), box_y1 + 76, false);
                    
//                    // Draw objective text
//                    draw_text(box_x1 + 10, box_y1 + 50, mission.objectives[j]);
//                    break;
//                }
//            }
//        }
//    }
//} else if (notification_active) {
//    // Draw notification for new mission
//    draw_set_alpha(0.9);
//    draw_set_color(c_black);
//    var notif_width = 180;
//    var notif_height = 50;
//    var notif_x1 = view_wport[0] - notif_width - 20;
//    var notif_y1 = 10;
//    var notif_x2 = notif_x1 + notif_width;
//    var notif_y2 = notif_y1 + notif_height;
    
//    draw_rectangle(notif_x1, notif_y1, notif_x2, notif_y2, false);
//    draw_set_color(c_lime);
//    draw_text(notif_x1 + 10, notif_y1 + 10, "New Mission Available!");
//    draw_set_alpha(1);
//}
var default_font = draw_get_font()
draw_set_font(font2);
if (visible) {
    // Mission box dimensions - increased width
    var box_width = 300;  // Increased from 200
    var box_height = 120; // Slightly increased to accommodate wrapped text
    var margin = 20;
    
    // Position in top right
    var box_x1 = view_wport[0] - box_width - margin;
    var box_x2 = view_wport[0] - margin;
    var box_y1 = margin;
    var box_y2 = box_y1 + box_height;
    
    // Draw main background
    draw_set_color(c_lime);
    draw_set_alpha(0.8);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, true);
    draw_set_color(c_black);
    draw_rectangle(box_x1, box_y1, box_x2, box_y2, false);
    draw_set_alpha(1);
    
    // Draw title
    draw_set_color(c_lime);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text(box_x1 + 10, box_y1 + 10, "CURRENT MISSION:");
    
    with(obj_mission_manager) {
        if (ds_list_size(global.active_missions) > 0) {
            var mission = global.active_missions[|0];
            
            // Draw mission title with text wrapping
            draw_set_color(c_lime);
            var title_wrapped = string_wrap(mission.title, box_width - 20);
            draw_text(box_x1 + 10, box_y1 + 30, title_wrapped);
            
            // Draw current objective
            for(var j = 0; j < array_length(mission.objectives); j++) {
                if (mission.progress[j] < mission.required[j]) {
                    // Draw objective text with wrapping
                    var wrapped_objective = string_wrap(mission.objectives[j], box_width - 20);
                    draw_text(box_x1 + 10, box_y1 + 50, wrapped_objective);
                    
                    // Draw progress bar - made wider
                    var bar_width = 280; // Increased from 180
                    var progress = mission.progress[j] / mission.required[j];
                    draw_set_color(c_dkgray);
                    draw_rectangle(box_x1 + 10, box_y1 + 90, box_x1 + 10 + bar_width, box_y1 + 96, false);
                    draw_set_color(c_lime);
                    draw_rectangle(box_x1 + 10, box_y1 + 90, box_x1 + 10 + (bar_width * progress), box_y1 + 96, false);
                    break;
                }
            }
        }
    }
} else if (notification_active) {
    // Draw notification for new mission
    draw_set_alpha(0.9);
    draw_set_color(c_black);
    var notif_width = 180;
    var notif_height = 50;
    var notif_x1 = view_wport[0] - notif_width - 20;
    var notif_y1 = 10;
    var notif_x2 = notif_x1 + notif_width;
    var notif_y2 = notif_y1 + notif_height;
    
    draw_rectangle(notif_x1, notif_y1, notif_x2, notif_y2, false);
    draw_set_color(c_lime);
    draw_text(notif_x1 + 10, notif_y1 + 10, "New Mission Available!");
    draw_set_alpha(1);
}

// Text wrapping function
function string_wrap(str, width) {
    var text_wrapped = "";
    var space_pos = -1;
    var last_space_pos = 0;
    var str_len = string_length(str);
    var line_width = 0;
    var char;
    
    for (var i = 1; i <= str_len; i++) {
        char = string_char_at(str, i);
        line_width += string_width(char);
        
        if (char == " ") {
            space_pos = i;
        }
        
        if (line_width > width) {
            if (space_pos != -1) {
                // If we found a space, break at the last space
                text_wrapped += string_copy(str, last_space_pos + 1, space_pos - last_space_pos - 1) + "\n";
                i = space_pos;
                last_space_pos = space_pos;
                line_width = 0;
                space_pos = -1;
            } else {
                // If no space found, break at current position
                text_wrapped += string_copy(str, last_space_pos + 1, i - last_space_pos - 1) + "\n";
                last_space_pos = i - 1;
                line_width = string_width(char);
            }
        }
    }
    
    // Add remaining text
    text_wrapped += string_copy(str, last_space_pos + 1, str_len - last_space_pos);
    return text_wrapped;
}

draw_set_font(default_font);