/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: Panel.pde
  Function: Generates a panel with white rectangles. The rectangles get colored from bottom up according to audio  
*/

 panel[] panels;
 panel[] panels12;
 int size = 8;
  
class panel {
 
 // Starting location
 float locX, locY;
 int w, h;
 // pLevel indicated the represents upto which height the colored rectangles are present
 float pLevel;
 
 // Constructor
 panel(float locX_, float locY_, int w_, int h_) {
     locX = locX_;
     locY = locY_;
     w = w_;
     h = int(0.94*h_) - 40 ;
 }
 
 void display(float level, color c)
 {
  // Only update pLevel if it becomes too big 
  if(level < pLevel)
      pLevel = level;
  
  rectMode(CENTER);
  pushMatrix();
  translate(locX, locY);
  for(int i = -w/2 + 30 ; i < w/2  ; i+= 30)
  {
    for(int j = -h/2 + 30; j < h/2 ; j+= 30)
     {
      if(j >= pLevel)
        fill(c, 255);
      else if(darkMode)
        fill(c, 100);
      else
        fill(255, pAlpha );
      rect(i, j, size, size);
     }  
      
  }
  popMatrix();
  pLevel += 20;
 }
 
  
}
