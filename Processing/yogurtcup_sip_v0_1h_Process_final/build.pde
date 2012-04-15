

// ------------------------------------------------------------------------ START drawDrainCupWithLip
void buildDrainCupWithLip( int sides, float r1, float r2, float h, float t, float d, float l)
{
  
  model=new UGeometry();
 
  float thickness = t;  
  float angle = 360 / sides;
  float halfHeight = h / 2;

  float ir1 = r1 - thickness; 
  float ir2 = r2 - thickness;
  
  float dr = d;
  float lor = l;

  // draw outside
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r2;
    float y1 = sin( radians( i * angle ) ) * r2;
    float x2 = cos( radians( i * angle ) ) * r1;
    float y2 = sin( radians( i * angle ) ) * r1;
    model.vertex( x1, y1, halfHeight);
    model.vertex( x2, y2, -halfHeight);
  }
  model.endShape();

  //draw inside
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir1;
    float y1 = sin( radians( i * angle ) ) * ir1;
    float x2 = cos( radians( i * angle ) ) * ir2;
    float y2 = sin( radians( i * angle ) ) * ir2;
    model.vertex( x1, y1, -halfHeight-thickness);
    model.vertex( x2, y2, halfHeight-thickness);
  }
  model.endShape();
  
  //draw lip walls
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * lor;
    float y1 = sin( radians( i * angle ) ) * lor;
    float x2 = cos( radians( i * angle ) ) * lor;
    float y2 = sin( radians( i * angle ) ) * lor;
    model.vertex( x1, y1, -halfHeight);
    model.vertex( x2, y2, -halfHeight-thickness);
  }
  model.endShape();  

 //draw lip bottom
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * r1;
    float y1 = sin( radians( i * angle ) ) * r1;
    float x2 = cos( radians( i * angle ) ) * lor;
    float y2 = sin( radians( i * angle ) ) * lor;
    model.vertex( x1, y1, -halfHeight);
    model.vertex( x2, y2, -halfHeight);

  }
  model.endShape();
  
  //draw lip top
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * lor;
    float y1 = sin( radians( i * angle ) ) * lor;
    float x2 = cos( radians( i * angle ) ) * ir1;
    float y2 = sin( radians( i * angle ) ) * ir1;
    model.vertex( x1, y1, -halfHeight-thickness);
    model.vertex( x2, y2, -halfHeight-thickness);
  }
  model.endShape();

 //draw r2 side ouside (floor outside)
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    model.vertex( x1, y1, halfHeight);
    model.vertex( x2, y2, halfHeight);
  }
  model.endShape();
  
  //draw r2 side outside (floor outside)
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * r2;
    float y2 = sin( radians( i * angle ) ) * r2;
    model.vertex( x1, y1, halfHeight);
    model.vertex( x2, y2, halfHeight);
  }
  model.endShape();
  
    //draw r2 side inside (floor inside)
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * ir2;
    float y1 = sin( radians( i * angle ) ) * ir2;
    float x2 = cos( radians( i * angle ) ) * dr;
    float y2 = sin( radians( i * angle ) ) * dr;
    model.vertex( x1, y1, halfHeight-thickness);
    model.vertex( x2, y2, halfHeight-thickness);
  }
  model.endShape();
  
  //draw drain walls
  model.beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x1 = cos( radians( i * angle ) ) * dr;
    float y1 = sin( radians( i * angle ) ) * dr;
    float x2 = cos( radians( i * angle ) ) * dr;
    float y2 = sin( radians( i * angle ) ) * dr;
    model.vertex( x1, y1, halfHeight-thickness);
    model.vertex( x2, y2, halfHeight);
  }
  model.endShape();

}

