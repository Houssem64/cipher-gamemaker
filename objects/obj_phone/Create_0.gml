// Phone dimensions and layout
layout = {
    width: 250,
    height: 400,
    bezel: 15,        // Border size
    status_height: 30, // Status bar height
    screen: {
        x: 0,         // Will be calculated
        y: 0,         // Will be calculated
        width: 0,     // Will be calculated
        height: 0     // Will be calculated
    }
}

// Calculate screen dimensions
layout.screen.width = layout.width - (layout.bezel * 2);
layout.screen.height = layout.height - (layout.bezel * 2);

// Phone state
state = {
    visible: false,
    battery: 100,
    signal: 4,  // Out of 4 bars
    time: "",
    position: {
        x: 0,  // Will be calculated
        y: 0   // Will be calculated
    }
}

// Center the phone on screen
state.position.x = (display_get_gui_width()*1.8 - layout.width) / 2;
state.position.y = (display_get_gui_height()*1.2 - layout.height) / 2;

// Calculate screen position
layout.screen.x = state.position.x + layout.bezel;
layout.screen.y = state.position.y + layout.bezel;

// Initialize time
update_time();