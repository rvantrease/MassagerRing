//Cylinder
//Outer dimension 74mm
//  radius 37mm
//Middle dimension 71mm
//  radius 35.5mm
//Inner dimension 64.17mm
//  radius 32.085
//Thickness of inner ring edge 2.57mm
    inner_ring_edge = 2.57;
//Thickness of rim 6.12mm
//Thickness of tab 6.12mm - 2.57mm = 3.55mm

//Ring edge = 37mm
    ring_edge = 37;

//Tabs X3
//Outer to inner 12.38mm
    tab_x = 12.38;
//Width 10.06mm
    tab_y = 10.06;
//Thickness = 3.55mm
    tab_z = 3.55;
//Tab 120 degrees apart
    tab_rotate = 120;
//Center hole 7.51mm
    tab_hole_x = tab_x - 7.51;
    tab_hole_y = tab_y/2;
//

//Reference ridge
translate([37,0,0])
    cylinder(h=6.12,r=2,center=false);
    
//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
//Ring
difference(){
    cylinder(h=6.12, r=37, $fa=6, center=false); 
    cylinder(h=7, r=32.085, $fa=5, center=false);
    //translate(v = [x, y, z]) 
    translate([0,0,2.57])
        cylinder(h=4,r=35.5, $fa=6, center=false);
}

// Massager head retention ring
// First 3D print issues
//     Ring
//         Not enough angles in ring edges
//     Tabs
//         Do not align with outside of 37mm ring
//         Penetrate too far into center of ring
//         Screw holes too large
//         Need notch on ring side

//First tab +x
translate([ring_edge-tab_x,tab_y/2 * -1,inner_ring_edge])
        DrawTab(0,0,0,0);

//Second tab -x +y
//Find point for right center of cube
//    x = cos(60) * r * -1
//    y = sin(60) * r
//Rotate 120 on that point
//Move point length of tab to -x
//Move point width of tab /2 to -y
//Draw new tab
    start_x2 = cos(60)*ring_edge*-1;
    start_y2 = sin(60)*37;
    start_z2 = inner_ring_edge;
    rotate_tab2 = 1;

//translate([start_x2,start_y2,start_z2])
//    rotate(120*rotate_tab2){
//        translate([-12.38,-5.03,0])
//            difference(){
//                cube([tab_x,tab_y,tab_z],center=false);
//                translate([tab_hole_x,tab_hole_y,0])
//                cylinder(h=tab_z, r=1.5,center = false);
//            }
//    }

translate([start_x2+10.5,start_y2-8.4,start_z2])
    rotate(120*rotate_tab2){
        DrawTab(-12.38,-5.03,1);
    }

module DrawTab(t_x,t_y,t_z){
        translate(t_x,t_y,t_z)
            difference(){
                cube([tab_x,tab_y,tab_z],center=false);
                translate([tab_hole_x,tab_hole_y,0])
                cylinder(h=tab_z, r=1.5,center = false);
            }    
}

//Third tab -x -y
//Find point for right center of cube
//    x = cos(60) * r * -1
//    y = sin(60) * r * -1
//Rotate 240 on that point
//Move point length of tab to -x
//Move point width of tab /2 to -y
//Draw new tab

translate([cos(60)*37*-1,sin(60)*37*-1,2.57])
//translate([-13.02,-34,2.57])
//    rotate(57, [0,0,1]){
    rotate(240){
        translate([-12.38,-5.03,0])
        difference(){
            cube([12.38,10.06,3.55],center=false);
            translate([4.67,5.03,0])
            cylinder(h=3.55, r=1.5,center = false);
        }
    }

//Rotates its child 'a' degrees about the axis of the coordinate system or around an arbitrary axis. The argument names are optional if the arguments are given in the same order as specified.

//Usage:
//rotate(a = deg_a, v = [x, y, z]) { ... }  
// or
//rotate(deg_a, [x, y, z]) { ... }
//rotate(a = [deg_x, deg_y, deg_z]) { ... }
//rotate([deg_x, deg_y, deg_z]) { ... }

