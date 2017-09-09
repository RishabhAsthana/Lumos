/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: Particle.pde
  Function: Generates a particle system, where nearby particles connect via a line whose width is determined by the audio  
*/

 // Arraylist to keep track of particles in particle system
 ArrayList<Particle> particles;
 // r represents the maximum distance till which the link should be made
 int r = 250;
 // N is the number of particles
 int N = 350;

 class Particle {
   
     PVector location, velocity;
     
     // Constructor
     Particle(int locX_, int locY_)
     {
        location = new PVector(locX_, locY_);
        velocity = new PVector(random(-5, 5), random(-5, 5));
     }
     
     // Updates the location, and wraps if necessary
     void run()
     {
        r = int(map(volAvg, 0 , maxVol, 50 , 150));
        update();
        wrap(); 
     }
     
     // Update the location of the particle with simple Euler integration  
     void update()
     {
        location.add(velocity); 
     }

     // Wraps the particle if it goes off the screen     
     void wrap()
     {
       // Wrap particles along the width of the screen
        if(location.x > width)
            location.x = 0;
        else if(location.x < 0)
            location.x = width;
       
       // Wrap particles along the height of the screen
       if(location.y > height)
            location.y = 0;
       else if(location.y < 0)
            location.y = height; 
     }
     
     // Creates a line between this particle and others if they are close enough
     // Uses N^2 comparisons, can be reduced by Barne's Hut, but I didn't feel it was needed
     void link(Particle p)
     {
        float d = dist(location.x, location.y, p.location.x, p.location.y);
        if(d < r)
        {
          float w = map(d, 0, r, 3, 0);
          int f = int(map(d, 0 , r, 255, 0));
          stroke(channelColor[0], f);
          strokeWeight(w);  
          line(location.x, location.y, p.location.x, p.location.y);  
        }
     }
   
 }
 

