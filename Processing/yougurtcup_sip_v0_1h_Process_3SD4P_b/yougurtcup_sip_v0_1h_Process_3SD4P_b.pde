/*
 * Based on shapes3D example code by Peter Lager
 *
 * Created by Carlyn Maw 
 * Abortive attempt to model a Yogurt Cup Self Irrigating Planter
 * Collection of Tubes
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
Tube drain;
Tube lip;

float oBasketY = 0;
float iBasketY = oBasketY-3;
float drainY = 27.5;
float lipY = -27.5;

boolean capvis = false;

void setup() {
  size(400, 400, OPENGL);
  // Use this to have fixed lighting
  baseMat = g.getMatrix(baseMat);

  pCamera = new PeasyCam(this, 100);
  pCamera.lookAt(0, 0, 0, 110);


  
  oBasket = new Tube(this, 8, 60);
  oBasket.setSize(27.5,27.5,27.5,27.5,55);
  oBasket.moveTo(0, oBasketY, 0);
  oBasket.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  oBasket.visible(capvis, Tube.BOTH_CAP);
  
  iBasket = new Tube(this, 8, 60);
  iBasket.setSize(25,25,25,25,55);
  iBasket.moveTo(0, iBasketY, 0);
  iBasket.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  iBasket.visible(capvis, Tube.BOTH_CAP);
  
  drain = new Tube(this, 8, 60);
  drain.setSize(3,3,3,3,3);
  drain.moveTo(0, drainY, 0);
  drain.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  drain.visible(capvis, Tube.BOTH_CAP);
  
  lip = new Tube(this, 8, 60);
  lip.setSize(42.5,42.5,42.5,42.5,3);
  lip.moveTo(0, lipY, 0);
  lip.drawMode(Shape3D.SOLID | Shape3D.WIRE);
  lip.visible(capvis, Tube.BOTH_CAP);


  camera(0, 0, 300, 0, 0, 0, 0, 1, 0);
}

void draw() {
  background(50);
  pushMatrix();
  g.setMatrix(baseMat);
  // stage lighting
  directionalLight(200, 200, 200, 100, 150, -100);
  ambientLight(160, 160, 160);
  popMatrix();

  oBasket.draw();
  iBasket.draw();
  drain.draw();
  lip.draw();
  } 

