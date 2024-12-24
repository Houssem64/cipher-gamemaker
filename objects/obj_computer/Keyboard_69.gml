// Key Down - E event
if (!has_been_interacted) {
    if(collision_rectangle(Rectanglex1,Rectangley1,Rectanglex2,Rectangley2,obj_Player,false,true)){
        has_been_interacted = true;
        terminal_open = true;
        previous_room = room; // Store current room before switching
        room_goto(rm_terminal); // Go to terminal room
    }
}