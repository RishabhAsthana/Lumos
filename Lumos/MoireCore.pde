 Core core;
 int[] n = {64, 48, 28, 20};
 float a = 0;

class Core {
  
  ArrayList<Grating> source;
  int locX, locY;
  int N, nLines;
  float rad = 400;
  
  Core(int locX_, int locY_)
  {
    locX = locX_;
    locY = locY_;
    setNnN((int)random(2));
  }
  
  void display(float a)
  {
    pushMatrix();
    translate(locX, locY);
    source = new ArrayList<Grating>();

    for(int i = 0; i < N; i++)
    source.add(new Grating(rad * cos(a+i*TWO_PI/N), rad * sin(a+i*TWO_PI/N), 0 , 1650));
    
     for(Grating g : source)
     {
      g.display(a, nLines); 
      a *= -1;
     }
     popMatrix();
   }
   
   void setNnN(int i)
   {
    N = i + 2;
    nLines = n[i];
   }
 }
 
  class Grating
 {
  
  float centerX, centerY;
  int r1, r2;
  
  Grating(float centerX_, float centerY_, int r1_, int r2_)
  {
   centerX = centerX_;
   centerY = centerY_;
   r1 = r1_;
   r2 = r2_; 
  }
  
  void display(float a1, int n)
  {
    
    pushMatrix();
    translate(centerX ,centerY);
    rotate(a1);

    for(float angle = 0; angle < TWO_PI; angle += PI/n)
    {
     float x1 =  r1 * cos(angle);
     float y1 =  r1 * sin(angle);
     float x2 =  r2 * cos(angle);
     float y2 =  r2 * sin(angle);
 
     line(x1, y1, x2, y2);
    }
    
    popMatrix();
  }
   
 }
