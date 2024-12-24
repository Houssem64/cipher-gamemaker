draw_self();
if(debug) {
    draw_set_color(c_lime);
    draw_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, true);
}

//if(terminal_open) {
//    // This section will run while in the terminal room
//    if(keyboard_check_pressed(vk_escape)) {
//        terminal_open = false;
//        room_goto(previous_room);
//        popup_id.visible = false;
//    }
//}