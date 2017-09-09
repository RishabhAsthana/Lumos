/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: RingSpeaker.pde
  Function: Generates a collection of coencentric circles which react to the beats detected in the local z-direction  
*/
 RingSpeaker r1,r2, r3, r4;
 float t = 0;
 float s = 0;
 int flip = 1;
 
 // Creates one circle at a paricular depth z
 class Ring {
  
    int centerX, centerY;
    float radius;
    
    Ring(int centerX_,int centerY_, int radius_)
    {
        centerX = centerX_;
        centerY = centerY_;
        radius = radius_; 
    }
    
    // Create circle of color c and at depth z
    void display(float z, color c)
    {
        int nmax = (visualizer == 9) ? 450 : 600;
        int r = int(map(z, 0, 800, 0, nmax)); 
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
 
 // Create a system of 'Ring', and set z value for each according to the audio
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
         translate(0, 0, -100);
         fill(c, al);
       popMatrix();
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
