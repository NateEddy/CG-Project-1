// Nate Eddy


#version 3.7;

global_settings {
    assumed_gamma 1.0
}

#include "colors.inc"
#include "textures.inc"

camera {
    location <0, 2, -5>
    look_at  <0, 1, 0>
}

light_source {
    <2, 4, -3>
    color White
}

// Background color
background { color SkyBlue }

// Declare animation variable
#declare FrameAngle = clock * 360;

// -------------------------------------
// Object 1: Spinning sphere with shiny texture
object {
    sphere { <0, 1, 0>, 1 }
    texture {
        pigment { color rgb <1, 0, 0> } // red
        finish { phong 0.9 reflection 0.3 }
    }
    rotate <0, FrameAngle, 0>
}

// -------------------------------------
// Object 2: Cube with matte texture
object {
    box { <-1, 0, -1>, <1, 1, 1> }
    texture {
        pigment { color rgb <0, 0.6, 0.2> } // green
        finish { diffuse 0.8 }
    }
    translate <3, 0, 0>
    rotate <FrameAngle, FrameAngle, 0>
}

// -------------------------------------
// Object 3: CSG Object - Hollow Cylinder
#declare Outer = cylinder { <0, 0, 0>, <0, 2, 0>, 1.0 }
#declare Inner = cylinder { <0, 0, 0>, <0, 2, 0>, 0.6 }

object {
    difference {
        object { Outer }
        object { Inner }
    }
    texture {
        pigment { color rgb <0.2, 0.2, 1> } // blue
        finish { phong 0.7 }
    }
    translate <-3, 0, 0>
    rotate <0, FrameAngle, 0>
}

