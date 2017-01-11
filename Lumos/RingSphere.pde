RingSphere rSphere;
RingSphere rSphere2;
RingSphere rSphere3;
RingSphere rSphere4;

 class RingSphere {
  
  PVector center, velocity; 
  int R = 300;
  ArrayList<SphereRing> rings;
  float a = 0;
  float maxVel = 0;
 // int count = 0;
  
  RingSphere(int locX, int locY, int R_)
  {
   R = R_;
   center = new PVector(locX, locY, 0);
   velocity = new PVector(0, 0);
   rings = new ArrayList<SphereRing>();
   for(int i = 1; i <= 10; i++)
   rings.add(new SphereRing(0, 0, (map(i, 1,20, -R,R) ) ) ); 
   velocity = new PVector(0,0, 0.5);
  }
  
  void display(float sc, boolean right, boolean rotX, boolean rotY)
  {  
     a += 0.01;
     pushMatrix();
     translate(center.x, center.y);
     if(right) rotateX(degrees(90));
     if(rotX) rotateX(a);
     if(rotY) rotateY(-a);
     //float scaw = map(mouseX, 0, width, 0, 5);
     scale(sc);
    
     float vel = map(volAvg, 0, maxVol, -5, 5);
     if(vel > maxVel)
     maxVel = vel;
     velocity = new PVector(0,0, maxVel);
 
   for(SphereRing r : rings)
   {
    float d = center.z - r.location.z;
    int rad = int(sqrt(R*R - d*d));
    r.update(velocity, R);
    
   /* if(count % 2 == 0)
     stroke(channelColor[0], 255 - pAlpha);
    else
    stroke(channelColor[1], pAlpha);*/
    r.display(rad);    
  //  count++;
   }
   popMatrix();
    maxVel -= 0.01;
  }
 }
 
 class SphereRing {
  
  PVector location;
  
  SphereRing(int locX, int locY, float locZ)
  {
   location = new PVector(locX, locY, locZ); 
  }
  
  void display(int rad)
  {
   
   pushMatrix();
   translate(location.x, location.y, location.z);
   
   ellipse(0, 0, 2 * rad, 2 * rad); 
   popMatrix();
  }
  
  void update(PVector velocity, int R)
  {
   if(location.z > R)
   location.z = -R;
   if(location.z < -R)
   location.z = R;
   
   location.add(velocity); 
  }
  
   
 }
