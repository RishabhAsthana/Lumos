/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: cPanel.pde
  Function: Generates a 2D plane where points are white ellipses, and they change color from the center in response to audio  
*/
 cPanel c;
 
 class cPanel {
  
  int locX, locY, w, h;
  PVector center;
  float pMax;
  
  cPanel(int locX_, int locY_, int w_, int h_)
  {
     locX = locX_;
     locY = locY_; 
     w = w_;
     h = h_;
     center = new PVector(w/2 , h/2);
     pMax = 0;
  }
  
  void display(float max)
  {
   fill(channelColor[0], pAlpha);
   
   if(max > pMax)
      pMax = max;
   for(int i = 60; i < w; i += 100)
   {
      for(int j = 30; j < h; j += 100 )
      {
          PVector loc = new PVector(i, j);
          float rad = map(loc.dist(center), 0, h, pMax , 0);
         
          if(loc.dist(center) < r )
              fill(channelColor[0], pAlpha);
          else
              fill(255, pAlpha);
              
          ellipse(i , j, rad, rad);
      }
   } 
   pMax--;
  }
   
 }
