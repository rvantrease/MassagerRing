//Cylinder
//Outer dimension 74mm, 2.9130"
//  radius 37mm
//Middle dimension 71mm, 2.7955"
//  radius 35.5mm
//Inner dimension 64.17mm, 2.5265
//  radius 32.085
//Thickness of ring 2.57mm
//Thickness of rim 6.12mm
//Thickness of tab 6.12mm - 2.57mm = 3.55mm
//Diameter of tab holes = 2.1mm

//Tabs X3
//Outer to inner 12.38mm, .4875"
//Width 10.06mm, .3960"
//Center hole 7.51mm, .2955"
//120 degrees apart

//Reference ridge
translate([37,0,0])
    cylinder(h=6.12,r=2,center=false);

//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
//Ring
difference(){
    cylinder(h=6.12, r=37, center=false); 
    cylinder(h=7, r=32.085, center=false);
    //translate(v = [x, y, z]) 
    translate([0,0,2.57])
        cylinder(h=4,r=35.5, center=false);
}

//cube(size = [x,y,z], center = true/false);
//First tab +x
difference(){
    translate([23.3,-5.03,2.57])
        cube([12.38,10.06,3.55],center=false);
    translate([28.07,0,2.57])
        cylinder(h=3.55, r=2.1,center = false);
}

//Second tab -x +y
//Move x = cosine of 30 degrees times radius of 37
//Move y = cosine of 60 degrees times radius of 37
//translate([-18.5,32,0])
//Adjust for starting at x,y is bottom left corner
//Translate x,y except add .5 * Tab Width or 5.03 to x
translate([-23.53,26.97,2.57])
    rotate(-58, [0,0,1]){
        difference(){
            cube([12.38,10.06,3.55],center=false);
            translate([7.51, 5.03,0])
                cylinder (h=3.55, r=2.1,center=false);
        }
    }

translate([-13.02,-34,2.57])
    rotate(57, [0,0,1]){
        difference(){
            cube([12.38,10.06,3.55],center=false);
            translate([7.51,5.03,0])
                cylinder(h=3.55,r=2.1,center=false);
        }
    }

//Rotates its child 'a' degrees about the axis of the coordinate system or around an arbitrary axis. The argument names are optional if the arguments are given in the same order as specified.

//Usage:
//rotate(a = deg_a, v = [x, y, z]) { ... }  
// or
//rotate(deg_a, [x, y, z]) { ... }
//rotate(a = [deg_x, deg_y, deg_z]) { ... }
//rotate([deg_x, deg_y, deg_z]) { ... }

