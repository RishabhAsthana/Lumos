/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: RingSphere.pde
  Function: Generates a wireframe sphere, where the frame moves and scales according to the audio  
*/

RingSphere rSphere;
RingSphere rSphere2;
RingSphere rSphere3;
RingSphere rSphere4;

 class RingSphere {
  
  // These two vectors denote where to draw and direction in which the wireframe should move in
  PVector center, velocity; 
  // Radius of sphere
  int R = 300;
  ArrayList<SphereRing> rings;
  // a is the angle to rotate with
  float a = 0;
  float maxVel = 0;
 
  RingSphere(int locX, int locY, int R_)
  {
     R = R_;
     center = new PVector(locX, locY, 0);
    
     rings = new ArrayList<SphereRing>();
     for(int i = 1; i <= 10; i++)
         rings.add(new SphereRing(0, 0, (map(i, 1,20, -R,R) ) ) ); 
    
     velocity = new PVector(0,0, 0.5);
  }
  
   // sc stands for scale, right indicates the direction of wrap, and rotX, rotY control the rotation of the whole sphere
  void display(float sc, boolean right, boolean rotX, boolean rotY)
  {  
     a += 0.01;
     pushMatrix();
       translate(center.x, center.y);
       if(right) 
           rotateX(degrees(90));
       if(rotX) 
           rotateX(a);
       if(rotY) 
           rotateY(-a);
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
        r.display(rad);    
     }
    popMatrix();
    maxVel -= 0.01;
  }
 }
 
 // Represents a single ring in the sphere
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
  
  // Wrap the wireframe
  void update(PVector velocity, int R)
  {
   if(location.z > R)
       location.z = -R;
   if(location.z < -R)
       location.z = R; 
   location.add(velocity); 
  }
  
   
 }
