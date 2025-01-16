if(!has_been_interacted) {
    if(collision_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, obj_Player, false, true)) {
        popup_id.visible = true;
		
      

        if(keyboard_check_pressed(ord("E"))) {
            has_been_interacted = true;
            computer_open = true;
			global.previous_room = Room1;
			
			room_goto(rm_computer); // Replace with your computer room name
    
           
        }
    } else {
        popup_id.visible = false;
    }
}
