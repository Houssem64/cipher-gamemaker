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




