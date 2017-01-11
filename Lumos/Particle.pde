
     ArrayList<Particle> particles;
     int r = 250;
     int N = 350;

 class Particle {
   
     PVector location, velocity;
     
     Particle(int locX_, int locY_)
     {
      location = new PVector(locX_, locY_);
      velocity = new PVector(random(-5, 5), random(-5, 5));
     }
     
     void run()
     {
      r = int(map(volAvg, 0 , maxVol, 50 , 150));
      update();
      wrap();
      //display(); 
     }
     
     void display()
     {
      fill(channelColor[0], pAlpha);
      noStroke();
      //ellipse(location.x, location.y, 40, 40); 
     }
     
     void update()
     {
      location.add(velocity); 
     }
     
     void wrap()
     {
      if(location.x > width)
      location.x = 0;
      else if(location.x < 0)
      location.x = width;
     
     if(location.y > height)
     location.y = 0;
     else if(location.y < 0)
     location.y = height; 
     
     }
     
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
      //noFill();
      //ellipse(location.x, location.y, d, d);
     }
   
 }
 

