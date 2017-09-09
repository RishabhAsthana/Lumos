/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: SpringField.pde
  Function: Generates a 2D spring system, where the springs are attached to particles, and respond to a audio beat by propagating the 2-D wave over the springs  
*/
 Field field;
 class Field
 {
  ArrayList<SpringParticle> particles;
  PVector center;
  float a = 0;
  Field()
  {
     particles = new ArrayList<SpringParticle>();
     for(int i = -boundH/2; i <= boundH/2; i+= 30)
       for(int j = -boundH/2; j <= boundH/2; j+= 30)
         particles.add(new SpringParticle(i, j));
         
     center = new PVector(boundW/2, boundH/2);
  } 
  
  void display()
  {
   t+=0.01;
   if(s < 0 || s > 0.3)
   flip *= -1;
   s += 0.001 * flip; 
    
   a += 0.01;
   pushMatrix();
    rotateX(s);
   
   translate(boundW/2, boundH/2);
   center = new PVector(0, 0);
   rotateZ(t);
   fill(channelColor[0]);
   noStroke();
   for(SpringParticle p : particles)
   {
       float d = PVector.dist(center, p.location); 
       
       if(true)
       {
          float rad = map(volAvg, 0, maxVol, 0, 800);
          p.size = map(volAvg, 0, maxVol, 0, map(d, 0, 800, 15,1));
          if(d < rad) 
          {
            float b = map(d, 0, 800, 6,0);
            p.applyForce(new PVector(0, 0, b));
          }
       }
     
      p.run(); 
   }
   popMatrix();
  }
 }

float stiffness = 0.01;
float sDamp = 0.12;

 // Represents a single spring particle
 class SpringParticle 
 {
  PVector location, velocity, acceleration, center;
  float size = 3;
  SpringParticle(float x, float y)
  {
     center = new PVector(x, y, 0);
     location = new PVector(x, y);
     velocity = new PVector(0, 0);
     acceleration = new PVector(0, 0);
  } 
  
  void update()
  {
     velocity.add(acceleration);
     velocity.mult(0.99);
     velocity.limit(10);
     location.add(velocity);
     acceleration = new PVector(0, 0);
  }
  
  void spring()
  {
     float d = location.z - center.z;
     PVector kx = new PVector(0, 0, -stiffness*d);
     kx.limit(2);
     PVector bv =  new PVector(velocity.x, velocity.y);
     bv.mult(-sDamp);
     PVector force = PVector.add(kx, bv);
     applyForce(kx);
  }

  void applyForce(PVector force)
  {
     acceleration.add(force); 
  }
  
  void run()
  {
     spring();
     update();
     display(); 
  }
  void display()
  {
     pushMatrix();
     translate(location.x, location.y, location.z);
     ellipse(0, 0, size, size); 
     popMatrix();
  }
 }
