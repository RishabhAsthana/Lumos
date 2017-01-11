
 float cosTable[];
 float sinTable[];
 BarSpeaker b;
 ArrayList<BarSpeaker> barSpeakers;
 int inR;
 int pnR = 100;
 
 class BarSpeaker {
  
   int locX, locY;
   int innerR, outerR;
   int prevRad = 100;
   
   BarSpeaker(int locX_, int locY_, int innerR_, int outerR_)
   {
    locX = locX_;
    locY = locY_;
    innerR = innerR_;
    outerR = outerR_; 
   }
   
   void display()
   {
    smooth(4);
    pushMatrix();
    translate(locX, locY);
    for (int i = 0; i < bsize; i+= 8)
     {
      float x1 = ( innerR ) * cosTable[i];  
      float y1 = ( innerR ) * sinTable[i];
      float x2 = ( outerR + abs(specVal[i] * 300) )  *cosTable[i];  
      float y2 = ( outerR + abs(specVal[i] * 300) )  *sinTable[i];
      strokeWeight(int(map(volAvg, 0 , maxVol, 5 , 10)));
     //strokeWeight(8);
      line(x1, y1, x2, y2);
      rotate(a);
      float scB = map(volAvg, 0 , maxVol, 1 , 1.6);
      //stroke(channelColor[1]);
    
      line(x1, y1, x2, y2);
     }
    popMatrix();
   }
   
 }
