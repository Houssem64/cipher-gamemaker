if (!state.visible) exit;

// Draw phone body
draw_set_color(c_lime);
draw_rectangle(
    state.position.x,
    state.position.y,
    state.position.x + layout.width,
    state.position.y + layout.height,
    false
);

// Draw screen background
draw_set_color(c_dkgray);
draw_rectangle(
    layout.screen.x,
    layout.screen.y,
    layout.screen.x + layout.screen.width,
    layout.screen.y + layout.screen.height,
    false
);

// Draw status bar
draw_status_bar();

// Draw current app or home screen
if (app_system.current_app == "home") {
    draw_home_screen();
} else {
    draw_app(app_system.current_app);
}
