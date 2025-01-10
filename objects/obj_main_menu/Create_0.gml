//////////////////////////////////
//                              //
//   bktGlitch 1.3.2            //
//    Written by Jan Vorisek    //
//    @odditica | odditica.fyi  //
//      jan@odditica.fyi        //
//       02/07/2022             //
//                              //
//     "Here we go again."      //
//							 	//
//////////////////////////////////

// You can init the shader here manually if you want, otherwise it will be done automatically the first
// time you run bktglitch_activate(), which might take a few frames.
// bktglitch_init()
application_surface_draw_enable(false); //disabling automatic redrawing of the application surface
display_set_gui_size(1920, 1080); //making sure the GUI layer stays always the same size
window_set_fullscreen(false)


alpha = 0; // Initial alpha value (0 = fully transparent, 1 = fully opaque)
fade_speed = 0.01; // Speed of the fade effect
fade_direction = 1; // 1 for fade in, -1 for fade out