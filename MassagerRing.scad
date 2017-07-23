//Cylinder
//Outer dimension 74mm, 2.9130"
//Middle dimension 71mm, 2.7955"
//Inner dimension 64.17mm, 2.5265
//Thickness of ring
//Thickness of rim

//Tabs X3
//Outer to inner 12.38mm, .4875"
//Width 10.06mm, .3960"
//Center hole 7.51mm, .2955"

//cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
difference(){
    cylinder(h=4, r1=74, r2=74, center=true); 
    cylinder(h=4, r1=64.17, r2=64.17, center=true);
    //translate(v = [x, y, z]) 
    translate([0,0,1])
        cylinder(h=4,r1=71,r2=71, center=true);
}