
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
   // noFill();
   fill(channelColor[0], pAlpha);
   //PVector mouse = new PVector(mouseX, mouseY);
   //println(mouse.dist(center));
   if(max > pMax)
   pMax = max;
   for(int i = 60; i < w; i += 100)
   {
    for(int j = 30; j < h; j += 100 )
    {
    PVector loc = new PVector(i, j);
    float rad = 0;
    //if(pMax > 0)
    rad = map(loc.dist(center), 0, h, pMax , 0);
    //else 
    //rad = map(loc.dist(center), 0, h, 0 , pMax);

    if(loc.dist(center) < r )
    fill(channelColor[0], pAlpha);
   // else if(darkMode)
   // fill(channelColor[0], 100);
    else
    fill(255, pAlpha);
    ellipse(i , j, rad, rad);
  /* rectMode(CENTER);
   pushMatrix();
   translate(i ,j);
   rotate(a);
    rect(0 , 0, rad, rad);
    popMatrix();*/
    
    }
   } 
   pMax--;
  }
   
 }
