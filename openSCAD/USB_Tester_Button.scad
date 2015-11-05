board_x = 31.0;
board_y = 50.0;
board_z =  1.6;

offset = 1;

base_x = board_x+offset+2;
base_y = board_y+offset+2;
base_z = 9;
base_width = 2;

module pushButton(){
   $fn=50;
   //Button
   translate([base_width-1,-22,-1.5]){
    //bcube([7,7,3],0,0);
    cube([6,6,6], center=true);
   }
   //Pin
   translate([base_width-1,-22,-3]){
    //bcube([3,3,6],1,6);
    //cylinder(h=1, r=1.5);
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


pushButton();