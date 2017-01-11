 Lissajous lissajous;

 class Lissajous
 {
  float x,y, prevX, prevY;
  int A,B;
  float delta;
  float a,b;
  float t = 0;
  
  Lissajous()
  {
   A = boundW/2;
   B = boundH/2;
   a = 6;
   b = 6;
   prevX = 0;
   prevY = 0;
   delta = 0.1; 
  }
  
  void display()
  {
  
  pushMatrix();
  if(beat.isOnset() == true)
  {
   a = random(2000);
   b = random(2000);
  }
  stroke(channelColor[1], pAlpha);
  strokeWeight(1);
  translate(boundW/2, boundH/2);
  for(int i = 0; i < 100; i++)
  {
  x = A * sin(a*t + delta);
  y = B * sin(b*t);
  line(prevX, prevY, x, y);
  prevX = x;
  prevY = y;
  t += 0.01;
  }
  popMatrix();
 }
 
}
