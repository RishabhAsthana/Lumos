
 void mousePressed()
 {
  if (mouseButton == CENTER)
  changeSize();  
  else if (mouseButton == RIGHT)
  uiAlpha = 255;
  //Play/Pause Button
  else if (mouseX > 0.49 * boundW && mouseX < 0.51 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH && mouseButton == LEFT)
  {
    paused = !paused;
    if (in.isPlaying()) 
      in.pause();
     else
      in.play();
  }
  //Progress Bar Scan
  else if (mouseX > 0.05 * boundW && mouseX < 0.95 * boundW && mouseY > 0.945 * boundH && mouseY < 0.955 * boundH && mouseButton == LEFT)
  {
    in.cue(int(map(mouseX, 0.05 * boundW, 0.95 * boundW, 0, in.length())));
  }
  //Volume
    else if (mouseX > 0.7 * boundW && mouseX < 0.75 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH && mouseButton == LEFT)
  {
    gain = int(map(mouseX, 0.70 * boundW, 0.75 * boundW, -40, 0));
    in.setGain(gain);
   // in.cue(int(map(mouseX, 0.05 * boundW, 0.95 * boundW, 0, in.length())));
  }
  //Close Button
  else if (mouseX > 0.915 * boundW && mouseX < 0.925 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH)
  {
    dh.dispose();
  }
  //Change Size (Maximize or Minimize)
   else if (mouseX > 0.885 * boundW && mouseX < 0.905 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH)
  {
    changeSize(); 
  }
  //Previous Button
  else if (mouseX > 0.44 * boundW && mouseX < 0.46 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH && mouseButton == LEFT && totalSize != 0 && fileIndex != 0)
  {
    fileIndex--;
    fileIndex = constrain(fileIndex, 0, files.size() - 1);
    changeTracks(fileIndex);
  }
  //Next Button
  else if (mouseX > 0.54 * boundW && mouseX < 0.56 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH && mouseButton == LEFT && totalSize != 0 && fileIndex != totalSize - 1)
  {
    fileIndex++;
    fileIndex = constrain(fileIndex, 0, files.size() - 1);
    changeTracks(fileIndex);
  }
  //Dark Button
  else if (mouseX > 0.055 * boundW && mouseX < 0.065 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH && mouseButton == LEFT )
   {
     darkMode = !darkMode;
   }
  //Next Visual Button
   else if (mouseX > 0.075 * boundW && mouseX < 0.090 * boundW && mouseY > 0.965 * boundH && mouseY < 0.975 * boundH && mouseButton == LEFT )
   {
     allowChange = 10;
   }
 }
 
 void keyPressed()
{
  // Play/Pause - Spacebar
  if (key == ' ')
  { 
    paused = !paused;
    uiAlpha = 255;
    if (in.isPlaying()) 
    {
      in.pause();
      //paused = true;
    } else
    {
      in.play();
     // paused = false;
    }
  }
  // Next Track
  else if (key == 'D' || key == 'd' && totalSize != 0)
  {
    fileIndex++;
    fileIndex = constrain(fileIndex, 0, files.size() - 1);
    changeTracks(fileIndex);
  }
  // Previous Track
  else if (key == 'A' || key == 'a' && totalSize != 0)
  {
    fileIndex--;
    fileIndex = constrain(fileIndex, 0, files.size() - 1);
    changeTracks(fileIndex);
  }
  // Close/Debugging
  else if (key == 'X' || key == 'x')
  {
    //visualizer = 7;
    //core.setNnN(3);
    allowChange = 10;
  }
   else if (key == 'C' || key == 'c')
  {
    //visualizer = 12;
    //visualizer = 10;
    allowChange = 10000;
    //in.mute();
  }
     else if (key == 'Z' || key == 'z')
  {
   debug = !debug;
  }
}
