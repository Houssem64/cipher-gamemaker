// Add these helper functions to the Create Event

function update_time() {
    var hours = current_hour;
    var minutes = current_minute;
    state.time = string(hours) + ":" + string_replace(string_format(minutes, 2, 0), " ", "0");
}

function draw_status_bar() {
	var default_font = draw_get_font()
	draw_set_font(fnt_phone)
    var bar_y = layout.screen.y;
    var bar_x = layout.screen.x;
    
    // Status bar background
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(
        bar_x, 
        bar_y, 
        bar_x + layout.screen.width, 
        bar_y + layout.status_height, 
        false
    );
    draw_set_alpha(1);
    
    // Time
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(
        bar_x + layout.screen.width/2, 
        bar_y + layout.status_height/2, 
        state.time
    );
    
    // Battery
    draw_battery(
        bar_x + layout.screen.width - 30, 
        bar_y + layout.status_height/2
    );
    
    // Signal
    draw_signal(
        bar_x + 20, 
        bar_y + layout.status_height/2
    );
    
    // Reset alignment
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	draw_set_font(default_font)
}

function draw_battery(xx, yy) {
    var batt = {
        width: 20,
        height: 10,
        nub: {
            width: 2,
            height: 4
        }
    }
    
    // Battery outline
    draw_set_color(c_white);
    draw_rectangle(
        xx, 
        yy - batt.height/2, 
        xx + batt.width, 
        yy + batt.height/2, 
        true
    );
    
    // Battery level
    var level_width = (batt.width - 2) * (state.battery/100);
    draw_rectangle(
        xx + 1, 
        yy - batt.height/2 + 1, 
        xx + 1 + level_width, 
        yy + batt.height/2 - 1, 
        false
    );
    
    // Battery nub
    draw_rectangle(
        xx + batt.width, 
        yy - batt.nub.height/2, 
        xx + batt.width + batt.nub.width, 
        yy + batt.nub.height/2, 
        false
    );
}

function draw_signal(xx, yy) {
    var signal = {
        bars: 4,
        width: 3,
        spacing: 2,
        height: 10
    }
    
    for (var i = 0; i < signal.bars; i++) {
        var height = ((i + 1) / signal.bars) * signal.height;
        var x_pos = xx + (i * (signal.width + signal.spacing));
        
        draw_set_color(i < state.signal ? c_white : c_gray);
        draw_rectangle(
            x_pos, 
            yy + (signal.height - height)/2,
            x_pos + signal.width, 
            yy + signal.height - (signal.height - height)/2,
            false
        );
    }
}

