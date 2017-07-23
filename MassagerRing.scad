//Cylinder
//Outer dimension 74mm, 2.9130"
//  radius 37mm
//Middle dimension 71mm, 2.7955"
//  radius 35.5mm
//Inner dimension 64.17mm, 2.5265
//  radius 32.085
//Thickness of ring
//Thickness of rim

//Tabs X3
//Outer to inner 12.38mm, .4875"
//Width 10.06mm, .3960"
//Center hole 7.51mm, .2955"
//120 degrees apart

//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
difference(){
    cylinder(h=4, r1=37, r2=37, center=true); 
    cylinder(h=4, r1=32.085, r2=32.085, center=true);
    //translate(v = [x, y, z]) 
    translate([0,0,1])
        cylinder(h=4,r1=35.5,r2=35.5, center=true);
}
//cube(size = [x,y,z], center = true/false);

translate([29.49,0,0])
    cube([12.38,10.06,4],center=true);

translate([-18.5,32,0])
    rotate(-60, [0,0,1]){
        cube([12.38,10.06,4],center=true);
    }
//Rotates its child 'a' degrees about the axis of the coordinate system or around an arbitrary axis. The argument names are optional if the arguments are given in the same order as specified.

//Usage:
//rotate(a = deg_a, v = [x, y, z]) { ... }  
// or
//rotate(deg_a, [x, y, z]) { ... }
//rotate(a = [deg_x, deg_y, deg_z]) { ... }
//rotate([deg_x, deg_y, deg_z]) { ... }

