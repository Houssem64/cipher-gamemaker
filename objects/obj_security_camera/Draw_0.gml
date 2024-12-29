// Draw the camera
draw_self();

//// Draw the exclamation point if the player is spotted
//if (player_spotted && spotted_timer < alarm_duration) {
	
   
//}

// Draw the debug rectangle (for visualization)
if(debug) {
draw_rectangle(x-100 , y+80, x+40 , y-10 , true);
draw_set_color(c_lime); // Set the debug rectangle color
}