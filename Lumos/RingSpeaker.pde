 
 RingSpeaker r1,r2, r3, r4;
 float t = 0;
 float s = 0;
 int flip = 1;
  class Ring {
  
  int centerX, centerY;
  float radius;
  
  Ring(int centerX_,int centerY_, int radius_)
  {
   centerX = centerX_;
   centerY = centerY_;
   radius = radius_; 
  }
  
    void display(float z, color c)
  {
    int nmax = (visualizer == 9) ? 450 : 600;
    int r = int(map(z, 0, 800, 0, nmax)); // 950 -> 450
    //noFill();
    if(r > radius)
    stroke(c);
    else
    stroke(c, 100);
    z = -z/(0.1*radius);
    noStroke();
    pushMatrix();
    translate(0, 0, z);  
    ellipse(0, 0, radius, radius);
    popMatrix();
  }
  
   
 }
 
 
 class RingSpeaker {
  
  int locX, locY;
  float angle;
  ArrayList<Ring> rings;
  
  RingSpeaker(int locX_, int locY_, int N)
  {
   locX = locX_;
   locY = locY_;
   rings = new ArrayList<Ring>();
   
   for(int i = 0; i < N; i+= 5)  // < 50
   rings.add(new Ring(locX, locY, i * 10));
  }
  
  void display(float a, color c, float al)
  {
   strokeWeight(8);
   
   angle = a;
   rectMode(CENTER);
   pushMatrix();
   translate(locX, locY);
   rotateX(s);
   rotateZ(t);
   pushMatrix();
   fill(0);
   
   //noFill();
   translate(0, 0, -100);
   //stroke(c, pAlpha - 155);
   fill(c, al);
   //noFill();
   //box(500, 500, 100);
   //noFill();
   popMatrix();
 //rect(0, 0,  500, 500);
  for(int i = 0; i < rings.size(); i++)  // <10
  {
   rings.get(i).display(angle, c);
   angle *= 0.999;
   if(angle < 0)
   angle = 0; 
  } 
  popMatrix();
  }
   
 }
