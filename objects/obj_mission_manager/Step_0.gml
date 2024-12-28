function handle_mission_notification() {
    if (show_completion_message) {
        if (completion_timer < completion_display_time/2) {
            mission_complete_alpha = min(mission_complete_alpha + 0.1, 1);
        } else if (completion_timer >= completion_display_time/2) {
            mission_complete_alpha = max(mission_complete_alpha - 0.1, 0);
        }
        
        completion_timer++;
        
        if (completion_timer >= completion_display_time) {
            show_completion_message = false;
            completion_timer = 0;
        }
    }
}


if(keyboard_check_pressed(vk_space)){
	
obj_mission_manager.update_mission_progress("basic_access", 0, 1);


}
if(keyboard_check_pressed(vk_numpad1)){
	
obj_mission_manager.update_mission_progress("basic_access", 1, 1);


}
if(keyboard_check_pressed(vk_numpad2)){
	
obj_mission_manager.update_mission_progress("basic_access", 2, 1);


}
if(keyboard_check_pressed(vk_numpad3)){
	
obj_mission_manager.update_mission_progress("basic_access", 3, 1);


}
if(keyboard_check_pressed(vk_numpad4)){
	
obj_mission_manager.update_mission_progress("basic_access", 4, 1);


}



