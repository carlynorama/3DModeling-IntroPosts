/**
cylinder taken from http://wiki.processing.org/index.php/Cylinder
@author matt ditton 2007-10-25

Updated 2012 04 14 by Carlyn Maw
put stand alone function into a sketch with PeasyCam control

*/

import processing.opengl.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam pCamera;
PMatrix3D baseMat;
 
void setup() {
  size(200, 200, OPENGL);
  // Use this to have fixed lighting
  baseMat = g.getMatrix(baseMat);

  pCamera = new PeasyCam(this, 300);
  pCamera.lookAt(0, 0, 0, 110);
  
}
 
void draw() {
  background(20);
  pushMatrix();
  g.setMatrix(baseMat);
  // stage lighting
  directionalLight(200, 200, 200, 100, 150, -100);
  ambientLight(160, 160, 160);
  popMatrix();
  
  cylinder(40,50, 12);
} 
 
void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
 
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }
 
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);
 
  vertex(0,   -h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }
 
  endShape();
 
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }
 
  endShape();
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], h/2, z[i]);
  }
 
  endShape();
}
