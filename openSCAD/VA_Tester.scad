//https://medium.com/@gendor/how-to-design-a-3d-printed-enclosure-for-your-product-3d28fd9b068c
use <obiscad/obiscad/bcube.scad>

board_x = 31.0;
board_y = 50.0;
board_z =  1.6;

//Offset of case around board, accounts for printing sizing
offset = 1;

base_x = board_x+offset+2;
base_y = board_y+offset+2;
base_z = 12.5;
base_width = 2;

module base_block() {
	difference() {
		base();
		translate([0,0,base_width])
		bcube([base_x-base_width,base_y-base_width,base_z],4,5);
	}
}

module base()
{
        /*
		$fn=50;
		minkowski() {
			cube([base_x,base_y,base_z]);
			cylinder(r=2,h=1);
		}*/
        
        bcube([base_x+2,base_y+2,base_z],4,5);
}

module board() {
   translate([base_width,base_width,-base_width]){ 
    bcube([board_x+offset,board_y+offset,board_z],4,5);
   }
    
   //Srew Term
   translate([base_width,25,7]){
     bcube([13.4,10,base_z-base_width],0,0);
   }
   //Screw Term
   translate([base_width,-25,7]){
    bcube([13.4,6,base_z-base_width],0,0);
   }

}

module bottom() {
 difference () {
    base_block();
    translate([-base_width,-base_width,-((base_z/2)-base_width-1.6)])
	board();
 }
}

module standoffs(){
    color("red",2){ 
       //Standoffs
       $fn=50;
       translate([(board_x/2)-4,(board_y/2)-4,-base_z/2]){
        cylinder(h=3, r=3.2);
       }
       translate([-(board_x/2)+4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=3, r=3.2);
       }
       translate([-(board_x/2)+4,(board_y/2)-4,-base_z/2]){
        cylinder(h=3, r=3.2);
       }
       translate([(board_x/2)-4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=3, r=3.2);
       }
       translate([(board_x/2)-4,(board_y/2)-4,-base_z/2]){
        cylinder(h=4.6, r=1.4);
       }
       translate([-(board_x/2)+4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=4.6, r=1.4);
       }
       translate([-(board_x/2)+4,(board_y/2)-4,-base_z/2]){
        cylinder(h=4.6, r=1.4);
       }
       translate([(board_x/2)-4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=4.6, r=1.4);
       }
   }
}

module nubs(){
   $fn=50;
   rotate([90,0,0]){
       translate([-board_x/2-base_width+1.6,.3,-1.3]){
           cylinder(h=3, r=.8); 
       }
       translate([board_x/2-base_width+2.5,.3,-1.3]){
           cylinder(h=3, r=.8); 
       }
   }
}

difference () {
	bottom();
    //slits
}

standoffs();
nubs();
