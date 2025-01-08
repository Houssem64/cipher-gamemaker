// Collision Event of obj_Projectile with obj_Player

if (place_meeting(x, y, obj_Player)) {
    instance_destroy(); // Destroy the projectile
    game_over(); // Call the game-over function
	gameover= true
}

// Script or function: game_over
function game_over() {
	global.currentRoom= room
	obj_Player.move_speed=0
	audio_pause_all()
	room_goto(rm_GameOver)
    // Stop all game logic
    // Stops the game (optional, depending on your needs)
   
    // Transition to a game-over room or display a message
   
}