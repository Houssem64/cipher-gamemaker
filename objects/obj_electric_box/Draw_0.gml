// Draw the fuse box
draw_self();
var x1 = x-5
var y1 = y -5
var x2 = x +6
var y2 = y +12
// Draw a message if the fuse box has been interacted with

if(debug) {
    draw_set_color(c_lime);
  
	draw_rectangle(x1,y1,x2,y2,true)
}