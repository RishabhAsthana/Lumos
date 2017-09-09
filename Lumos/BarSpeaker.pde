/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: BarSpeaker.pde
  Function: Generates a visual where the contours of a speaker are spectral values, and they pulse with the beat
*/ 

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
   
   // Init
   BarSpeaker(int locX_, int locY_, int innerR_, int outerR_)
   {
    locX = locX_;
    locY = locY_;
    innerR = innerR_;
    outerR = outerR_; 
   }
   
   // Display the visual
   void display()
   {
    smooth(4);
    pushMatrix();
    translate(locX, locY);
    // We simply create lines starting and ending at innerR and outerR respectively and scale outerR according to spectral values
    for (int i = 0; i < bsize; i+= 8)
    {
      float x1 = ( innerR ) * cosTable[i];  
      float y1 = ( innerR ) * sinTable[i];
      float x2 = ( outerR + abs(specVal[i] * 300) )  *cosTable[i];  
      float y2 = ( outerR + abs(specVal[i] * 300) )  *sinTable[i];
      strokeWeight(int(map(volAvg, 0 , maxVol, 5 , 10)));
      // We draw one set of lines rotating at X
      line(x1, y1, x2, y2);
      // We now draw a bolder set of lines roatating at 2X. Gives a nice effect when colors are Added
      rotate(a);
      float scB = map(volAvg, 0 , maxVol, 1 , 1.6);   
      line(x1, y1, x2, y2);
     }
    popMatrix();
   }
   
 }
