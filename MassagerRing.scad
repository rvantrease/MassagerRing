// Massager head retention ring
// First 3D print issues
//     Ring
//         xNot enough angles in ring edges
//     Tabs
//         xDo not align with outside of 37mm ring
//         xPenetrate too far into center of ring
//         xScrew holes too large
//         xNeed notch on ring side

//Cylinder
//Outer dimension 74mm
//Ring edge = 37mm
    ring_edge = 37;
//Middle dimension 71mm
//  radius 35.5mm
//Inner dimension 64.17mm
//  radius 32.085
//Thickness of inner ring edge 2.57mm
    inner_ring_edge = 2.57;
//Thickness of rim 6.12mm
    rim_thickness = 6.12;
//Thickness of tab 6.12mm - 2.57mm = 3.55mm

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
//Screw hole diameter 1.5mm
    screw = 1.5;

//Reference ridge
translate([ring_edge+2,0,0])
    cylinder(h=rim_thickness,r=2,center=false);
    
//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
//Ring
difference(){
    cylinder(h=rim_thickness, r=ring_edge+2, $fa=6, center=false); 
    cylinder(h=7, r=32.085, $fa=5, center=false);
    //translate(v = [x, y, z]) 
    translate([0,0,2.57])
        cylinder(h=4,r=35.5, $fa=6, center=false);
}

difference(){
    union(){
        //First tab +x
            DrawTab(ring_edge-tab_x,tab_y/2 * -1,inner_ring_edge,0,0,0,0);

        //Second tab -x +y
            DrawTab(cos(60)*ring_edge*-1,sin(60)*37,
        inner_ring_edge,tab_x*-1,tab_y/2*-1,0,1);
    
        //Third tab -x -y
            DrawTab(cos(60)*ring_edge*-1,sin(60)*ring_edge*-1,
            inner_ring_edge,tab_x*-1,tab_y/2*-1,0,2);
    }
    translate([0,0,5.11])
        difference(){
            cylinder(h=6, r=35.5, $fa=6, center=false);
            cylinder(h=6, r=32.085, $fa=6, center=false);
        }
}

module DrawTab(s_x,s_y,s_z,t_x,t_y,t_z,r){
    //s_x - starting x point for cube before rotation and re-orientation
    //s_y - starting y point for cube before rotation and re-orientation
    //s_z - starting z point for cube before rotation and re-orientation
    //t_x - after rotation translated starting x point for cube
    //t_y - after rotation translated starting y point for cube
    //t_z - after rotation translated starting z point for cube
    //r   - rotation multiplier
    translate([s_x,s_y,s_z])
    rotate(120*r){
        translate([t_x,t_y,t_z])
            difference(){
                cube([tab_x,tab_y,tab_z],center=false);
                translate([tab_hole_x,tab_hole_y,0])
                    cylinder(h=tab_z, r=screw,center = false);
            }
        }    
}
