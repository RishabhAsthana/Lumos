  //panel p;
  panel[] panels;
  panel[] panels12;
  int size = 8;
  
class panel {
 
 float locX, locY;
 int w, h;
 float pLevel;
 
 panel(float locX_, float locY_, int w_, int h_) {
   locX = locX_;
   locY = locY_;
   w = w_;
   h = int(0.94*h_) - 40 ;
   
 }
 
 void display(float level, color c)
 {
  
  if(level < pLevel)
  pLevel = level;
  
 
  
  rectMode(CENTER);
  pushMatrix();
  translate(locX, locY);
  for(int i = -w/2 + 30 ; i < w/2   ; i+= 30)
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
    //ellipse(i, j, size, size);
   }  
    
  }
  popMatrix();
  
   pLevel += 20;
 }
 
  
}
