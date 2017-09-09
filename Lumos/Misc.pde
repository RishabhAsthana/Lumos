/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: Misc.pde
  Function: Mangages the utilities used for background tasks
*/ 

 import sojamo.drop.*;
 import java.awt.Robot;
 import java.awt.*;
 
 Robot robot;
 DisposeHandler dh;
 SDrop drop;
 ArrayList<String> files;
 int totalSize = 0;
 int fileIndex = 0;
 int transAlpha = 0;
 boolean switching = false;
 // This keeps track of how many times a certain visual has been chosen
 // This is done because visuals are chosen randomly, and the random function doesn't seem to be uniform
 int[] visualChosen = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
 
 
 // This function simply stores the user dropped fiel path to the playlist
 void dropEvent(DropEvent theDropEvent) {
  println("Drop Happened");
  if (theDropEvent.isFile())
  {
    String file = "" + theDropEvent.file();
    if (file.substring(file.length() - 3, file.length()).equalsIgnoreCase("mp3"))
    {
      String path = file.replace('\\', '/');
      files.add(path);
      println("Total : " + files.size() + " Track added : " + path);
    } 
  } 
}

// Swtich tracks
void changeTracks(int index)
{
  uiAlpha = 255;
  minim.stop(); 
  in = minim.loadFile(files.get(index), 1024);
  in.play();
  meta = in.getMetaData();
  // Control the volume
  in.setGain(gain);

  // Reset the max ranges
  for (float f : maxChannel)
    f = 3;
  maxVol = 3;
  for(float f : max3Channel)
    f = 3;

  println(index + " : " + files.get(index));
}

// Changes the current visual
void change()
{ 
   if(switching)
   {
      transAlpha += 22;
      if(transAlpha > 255)
      {
         allowChange = (int)random(1200, 1600);
         switching = false;
         visualizer = visualRandomize(); 
         if(visualizer == 4)
            core.setNnN((int)random(2));
         // The variables again are parameters to a visualization. Will refactor
         pnR = 100;
         t = 0;
         s = 0;
      } 
   }
   else if(transAlpha > 0)
     transAlpha-=22;
   
   fill(channelColor[0], transAlpha);
   noStroke();
   rectMode(CORNER);
   rect(0, 0, width, height);
}

// Chooses a random visual, keeping into account that 
int visualRandomize()
{
 int v = 0;
 int smallest = visualChosen[0];
 
 for(int i = 0; i < visualChosen.length; i++)
   if(smallest > visualChosen[i])
      smallest = visualChosen[i];
 do
 {
    v =  int(random(visualChosen.length));
 } while (visualChosen[v] != smallest);
 
 visualChosen[v]++;
 return v;
}

// This gets created when the application exits, for proper clean up
public class DisposeHandler
{
    DisposeHandler(PApplet pa)
    {
        pa.registerDispose(this);
    }
  
    public void dispose()
    {
        println("In dispose");
        in.close();
        minim.stop();
        exit();
    }
}
