draw_self()
var x1 = x
var y1 = y+20
var x2 = x+30
var y2 = y+10
if(debug) {
    draw_set_color(c_lime);
    draw_rectangle(Rectanglex1, Rectangley1, Rectanglex2, Rectangley2, true);
	draw_rectangle(x1,y1,x2,y2,true)
}

