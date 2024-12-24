if(!has_been_interacted) {
    if(collision_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, obj_Player, false, true)) {
        popup_id.visible = true;
        
        if(keyboard_check_pressed(ord("E"))) {
            has_been_interacted = true;
            terminal_open = true;
			global.previous_room = Room1;
            room_goto(rm_terminal);
        }
    } else {
        popup_id.visible = false;
    }
}
