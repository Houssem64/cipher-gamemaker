var default_font = draw_get_font()
function draw_mission_completion() {
    if (show_completion_message) {
        draw_set_alpha(mission_complete_alpha);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        // Draw background
        draw_set_color(c_black);
        draw_rectangle(0, room_height/3, room_width, room_height/3 * 2, false);
        
        // Draw text
        draw_set_color(c_lime);
        draw_text(room_width/2, room_height/2, completion_message);
        
        draw_set_alpha(1);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}
//function draw_mission_completion() {
//    if (show_completion_message) {
//        draw_set_alpha(mission_complete_alpha);
//        draw_set_halign(fa_center);
//        draw_set_valign(fa_middle);
        
//        // Draw background
//        draw_set_color(c_black);
//        draw_rectangle(0, room_height/3, room_width, room_height/3 * 2, false);
        
//        // Draw text
//        draw_set_color(c_lime);
//        draw_text(room_width/2, room_height/2, completion_message);
        
//        draw_set_alpha(1);
//        draw_set_halign(fa_left);
//        draw_set_valign(fa_top);
//    }
//}

//// Draw current mission info
function draw_mission_info() {
    var current_mission = get_current_mission();
    if (current_mission != noone) {
        var ypos = 20;
        draw_set_color(c_white);
        draw_text(20, ypos, "Current Mission: " + current_mission.title);
        ypos += 25;
        draw_text(20, ypos, "Description: " + current_mission.description);
        ypos += 25;
        
        // Draw objectives
        for (var i = 0; i < array_length(current_mission.objectives); i++) {
            var status = current_mission.progress[i] >= current_mission.required[i] ? "✓" : "□";
            draw_text(20, ypos, status + " " + current_mission.objectives[i]);
            ypos += 20;
        }
    }
}
draw_set_font(default_font)
//// Clean Up Event
//if (ds_exists(missions, ds_type_list)) ds_list_destroy(missions);
//if (ds_exists(active_missions, ds_type_list)) ds_list_destroy(active_missions);
//if (ds_exists(completed_missions, ds_type_list)) ds_list_destroy(completed_missions);