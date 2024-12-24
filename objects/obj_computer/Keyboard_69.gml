if (!has_been_interacted) {
if(collision_rectangle(Rectanglex1,Rectangley1,Rectanglex2,Rectangley2,obj_Player,false,true)){
has_been_interacted = true;
 terminal_open = true; // Open terminal when interacted with
}
}