/*
 * Based on shapes3D example code by Peter Lager
 *
 * Created by Carlyn Maw 
 * Abortive attempt to model a Yogurt Cup Self Irrigating Planter
 * Nested Baskets
 * 2012 04 14
 *
 */


import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

import processing.opengl.*;
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam pCamera;
PMatrix3D baseMat;

//Tube tube;
Tube oBasket;
Tube iBasket;

void setup() {
  size(400, 400, OPENGL);
  // Use this to have fixed lighting
  baseMat = g.getMatrix(baseMat);

  pCamera = new PeasyCam(this, 100);
  pCamera.lookAt(0, 0, 0, 110);
  
  oBasket = new Tube(this, 8, 60);
  oBasket.setSize(32,32,27.5,27.5,55);
  oBasket.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  //basket.drawMode(Shape3D.SOLID, Tube.BOTH_CAP);
  oBasket.drawMode(Shape3D.SOLID, Tube.E_CAP);
  oBasket.drawMode(Shape3D.WIRE, Tube.S_CAP);
  boolean vis = false;
  oBasket.visible(vis, Tube.S_CAP);
  
  iBasket = new Tube(this, 8, 60);
  iBasket.setSize(29,29,20,20,55);
  iBasket.moveTo(0, -5, 0);
  iBasket.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  //basket.drawMode(Shape3D.SOLID, Tube.BOTH_CAP);
  iBasket.drawMode(Shape3D.SOLID, Tube.E_CAP);
  iBasket.drawMode(Shape3D.WIRE, Tube.S_CAP);
  boolean vis2 = false;
  iBasket.visible(vis, Tube.S_CAP);

  camera(0, 0, 300, 0, 0, 0, 0, 1, 0);
}

void draw() {
  background(20);
  pushMatrix();
  g.setMatrix(baseMat);
  // stage lighting
  directionalLight(200, 200, 200, 100, 150, -100);
  ambientLight(160, 160, 160);
  popMatrix();

  oBasket.draw();
  iBasket.draw();
  } 

