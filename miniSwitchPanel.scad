// Author: Anthony Sheetz
// Classic Mini Cooper switch plate
// 2026
// Copyright: CC BY-NC-SA
//
// Created for my friend and his mini Tobias the Angry Blueberry
// See @tobytheAngryBlueberry on Instagram

$fn=100;
thickness=1.5;
spacing=28;
heaterSwitch=10;
heaterSwitchKey=2.2;
switches=6.5;
screws=2.25;
mountingDistance=230/2;
mountingCenterlineOffset=-8;
switchOffset=8;
bulbDiam=4.5;
bulbHeight=10;
retainer=.2;

difference(){
    union(){
        hull(){
            translate([mountingDistance,mountingCenterlineOffset,0])
                cylinder(h=thickness,r=screws+4, center=true);
            translate([-mountingDistance,mountingCenterlineOffset,0])
                cylinder(h=thickness,r=screws+4, center=true);
            cube([200,52,thickness], center=true);
        }
        translate([0,-15,15/2]){
            cube([200,10,bulbHeight+5], center=true);
        }
    }
    //heater switch
    union(){
        cylinder(h=thickness+2,r=heaterSwitch, center=true);
        translate([10,0,0])
            cube([heaterSwitchKey,heaterSwitchKey,thickness+2], center=true);
    }
    //other switches
    translate([spacing,switchOffset,0])
        cylinder(h=thickness+2,r=switches, center=true);
    translate([-spacing,switchOffset,0])
        cylinder(h=thickness+2,r=switches, center=true);
    translate([spacing*2,switchOffset,0])
        cylinder(h=thickness+2,r=switches, center=true);
    translate([-(spacing*2),switchOffset,0])
        cylinder(h=thickness+2,r=switches, center=true);
    translate([spacing*3,switchOffset,0])
        cylinder(h=thickness+2,r=switches, center=true);
    translate([-(spacing*3),switchOffset,0])
        cylinder(h=thickness+2,r=switches, center=true);
    
    //mounting holes
    translate([mountingDistance,mountingCenterlineOffset,0])
        cylinder(h=thickness+2,r=screws, center=true);
    translate([-mountingDistance,mountingCenterlineOffset,0])
        cylinder(h=thickness+2,r=screws, center=true);
    symbols();

    // bulb holders
        translate([0,-15,0]){
            translate([spacing,0,0])
                bulb();
            translate([-spacing,0,0])
                bulb();
            translate([spacing*2,0,0])
                bulb();
            translate([-(spacing*2),0,0])
                bulb();
            translate([spacing*3,0,0])
                bulb();
            translate([-(spacing*3),0,0])
                bulb();
        }

}
module symbols(){
    translate([-spacing*3-switches-2,-9,-thickness/2+.4]){
        color("red")
            rotate([180,0,0])
                linear_extrude(0.4)
                    import("/home/sheetzam/Documents/openscad/miniSwitchPanel/1.svg");
    }
    translate([-spacing*2-switches-2,-9,-thickness/2+.4]){
        color("red")
            rotate([180,0,0])
                linear_extrude(0.4)
                    import("/home/sheetzam/Documents/openscad/miniSwitchPanel/2.svg");
    }
    translate([-spacing-switches-2,-9,-thickness/2+.4]){
        color("red")
            rotate([180,0,0])
                linear_extrude(0.4)
                    import("/home/sheetzam/Documents/openscad/miniSwitchPanel/3.svg");
    }
    translate([spacing-switches-2,-9,-thickness/2+.4]){
        color("red")
            rotate([180,0,0])
                linear_extrude(0.4)
                    import("/home/sheetzam/Documents/openscad/miniSwitchPanel/5.svg");
    }
    translate([spacing*2-switches-2,-9,-thickness/2+.4]){
        color("red")
            rotate([180,0,0])
                linear_extrude(0.4)
                    import("/home/sheetzam/Documents/openscad/miniSwitchPanel/6.svg");
    }
    translate([spacing*3-switches-2,-9,-thickness/2+.4]){
        color("red")
            rotate([180,0,0])
                linear_extrude(0.4)
                    import("/home/sheetzam/Documents/openscad/miniSwitchPanel/7.svg");
    }
}
module bulb (){
    difference(){
        union(){
            cylinder(h=bulbHeight*2, d=bulbDiam);
        }
        translate([-bulbDiam/2,1.7,bulbHeight])
            cube([bulbDiam, bulbDiam, retainer]);
    }
}