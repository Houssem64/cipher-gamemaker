if (keyboard_check_pressed(vk_escape)) {
    paused = !paused;
    if (paused) {
        instance_deactivate_all(true);
        instance_activate_object(obj_pause_controller);
		instance_activate_object(obj_game_manager);
		instance_activate_object(obj_camera_controller);
    } else {
        instance_activate_all();
    }
}

if (paused) {
    // Menu navigation
    if (keyboard_check_pressed(vk_up)) {
        selected_option -= 1;
        if (selected_option < 0) selected_option = array_length(menu_options) - 1;
    }
    
    if (keyboard_check_pressed(vk_down)) {
        selected_option += 1;
        if (selected_option >= array_length(menu_options)) selected_option = 0;
    }
    
    // Menu selection
    if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)) {
        switch(selected_option) {
            case 0: // Resume
                paused = false;
                instance_activate_all();
                break;
            
            case 1: // Options
                // Add your options menu code here
                break;
            
            case 2: // Quit to Menu
                room_goto(rm_mainMenu); // Change to your menu room
                paused = false;
                instance_activate_all();
                break;
        }
    }
}
