//https://medium.com/@gendor/how-to-design-a-3d-printed-enclosure-for-your-product-3d28fd9b068c
use <obiscad/obiscad/bcube.scad>

board_x = 31.0;
board_y = 50.0;
board_z =  1.6;

offset = 1;

base_x = board_x+offset+2;
base_y = board_y+offset+2;
base_z = 9.5;
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
        
        bcube([base_x+2,base_y+2,base_z+2],4,5);
}

module board() {
   translate([base_width,base_width,-base_width]){ 
    bcube([board_x+offset,board_y+offset,board_z],4,5);
   }
    
   //USB Micro
   translate([base_width,25,1]){
    bcube([9,10,3.5],0,0);    
   }
   
   //Button
   translate([base_width+1,-20,-2]){
    bcube([7,7,6],0,0);
   }
   
   //LED
   //translate([-base_width-3,-22.5,-base_z/2-(-base_width/2)+.8]){
   // bcube([4,2,1.25],0,0);
   //}
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
        cylinder(h=5.6, r=3.2);
       }
       translate([-(board_x/2)+4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=5.6, r=3.2);
       }
       translate([-(board_x/2)+4,(board_y/2)-4,-base_z/2]){
        cylinder(h=5.6, r=3.2);
       }
       translate([(board_x/2)-4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=5.6, r=3.2);
       }
       translate([(board_x/2)-4,(board_y/2)-4,-base_z/2]){
        cylinder(h=7.2, r=1.4);
       }
       translate([-(board_x/2)+4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=7.2, r=1.4);
       }
       translate([-(board_x/2)+4,(board_y/2)-4,-base_z/2]){
        cylinder(h=7.2, r=1.4);
       }
       translate([(board_x/2)-4,-(board_y/2)+4,-base_z/2]){
        cylinder(h=7.2, r=1.4);
       }
   }
}

module display(){
    translate([base_x/2-12,0,-base_z/2-(-base_width/2)]){
        //bcube([26,28,base_width+1],0,0);//Full display
        bcube([13.5,24,base_width+4],0,0);//Visiable area only
    }
    
}
//Need to add side nub for button
module nubs(){
   $fn=50;
   rotate([90,0,0]){
       translate([-board_x/2-base_width+1.6,3.5,0]){
           cylinder(h=3, r=.8); 
       }
       translate([board_x/2-base_width+2.5,3.5,0]){
           cylinder(h=3, r=.8); 
       }
   }
}

module pushButton(){
   $fn=50;
   //Button
   translate([base_width-1,-22,-3.5]){
    //bcube([7,7,3],0,0);
    cube([6,6,2], center=true);
   }
   //Pin
   translate([base_width-1,-22,-3]){
    //bcube([3,3,6],1,6);
    cylinder(h=1, r=1.5);
   }
   //Push nub
   //translate([base_width-1,-22,-5]){
   // cylinder(h=3, r=2);
   //}
   //Arms
   translate([base_width+3.3,-22,-3.75]){
    cube([4,1.5,1.5], center = true);
   }
   translate([base_width-5.3,-22,-3.75]){
    cube([4,1.5,1.5], center = true);
   }
}

module buttonTracks(){
    translate([base_width+3,-22,-3.4]){
    cube([3,2,1.2], center = true);
   }
   translate([base_width-7,-22,-3.4]){
    cube([3,2,1.2], center = true);
   }
}

module buttonHolder(){
    difference(){
        translate([base_width+5,-22,-1.4]){
            cube([5,5,4.5], center = true);
        }
        translate([base_width+3.5,-22,-1.4]){
            cube([5,3,5.5], center = true);
        }
   }
   difference(){
       translate([base_width-7,-22,-2.4]){
            cube([5,5,4.5], center = true);
       }
       translate([base_width-5.5,-22,-1.4]){
            cube([5,3,5.5], center = true);
       }
   }
}

difference () {
	bottom();
    display();
   //buttonTracks();
    
}

standoffs();
nubs();
buttonHolder();
//pushButton();

