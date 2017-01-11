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
 int[] visualChosen = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
 
 
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

void changeTracks(int index)
{
  uiAlpha = 255;
  minim.stop(); 
  in = minim.loadFile(files.get(index), 1024);
  in.play();
  meta = in.getMetaData();
  in.setGain(gain);

  for (float f : maxChannel)
    f = 3;
  maxVol = 3;
  for(float f : max3Channel)
    f = 3;

  println(index + " : " + files.get(index));
}

void change()
{
 
 if(switching)
 {
  transAlpha += 22;
    if(transAlpha > 255)
    {
     allowChange = (int)random(1200, 1600);
     //allowChange = (int)random(600, 1000);
     switching = false;
     visualizer = visualRandomize(); //(int)random(8);
     if(visualizer == 4)
     core.setNnN((int)random(2));
     //if(visualizer == 6)
     //core.setNnN((int)random(3, 7));
     pnR = 100;
     t = 0;
     s = 0;
    } 
 }
 else
 if(transAlpha > 0)
 transAlpha-=22;
 
 fill(channelColor[0], transAlpha);
 noStroke();
 rectMode(CORNER);
 //if(visualizer < 9)
 //hint(DISABLE_DEPTH_TEST);
 rect(0, 0, width, height);
 //hint(ENABLE_DEPTH_TEST);
}

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
 }
 while (visualChosen[v] != smallest);
 visualChosen[v]++;
 return v;
 }


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
