/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: UI.pde
  Function: Generates and displays the UI
*/
 UI ui;
 int boundW, boundH;
 int toggle = 1;
 int uiAlpha = 255;
 PFont font;
 int pos, len;
 boolean debug = false;

 class UI{
  
  int w, h;
 
  UI(int w_, int h_)
  {
     w = w_;
     h = h_;
     frame.setSize(w, h);
  } 
  
  void display()
  {
   noStroke();
   noFill();
   
   // Set the color
   stroke(channelColor[0], uiAlpha);
   strokeWeight(2); 
   
   // Display the elements
   progressBar();
   volumeControl();
   closeButton();
   sizeButton();
   nextButton();
   stroke(channelColor[0], uiAlpha);
   prevButton();
   stroke(channelColor[0], uiAlpha);
   displayMeta();
   darkButton();
   nextVisualButton();
   lockVisual();
   
   if (in.isPlaying())
       pauseButton();
   else
   {
       playButton();
       uiAlpha = 255; 
   }
  
   if(mouseY > 0.90 * h)
     uiAlpha = 255;
   
   if(uiAlpha > 0)
     uiAlpha--;
    
   if(allowChange < -2000)
     allowChange = -5;
   if(allowChange == 0)
     robot.mouseMove(mouseX + 1, mouseY);
   }
  
  void progressBar()
  {
    strokeWeight(1);
    line(0.05 * w, 0.95 * h, 0.95 * w, 0.95 * h);
    strokeWeight(2); 
    //The light up on hover is achieved using this, on hovering, just increase the stroke weight.
    if (mouseX > 0.05 * w && mouseX < 0.95 * w && mouseY > 0.945 * h && mouseY < 0.955 * h)
      strokeWeight(4); 
    
    pos = in.position();
    len = in.length();

    line(0.05 * w, 0.95 * h, map(pos, 0, len, 0.05 * w, 0.95 * w ), 0.95 * h);
  }
  
  void volumeControl()
  {
    strokeWeight(1);
    line(0.7 * w, 0.97 * h, 0.75 * w, 0.97 * h);
    strokeWeight(2); 
    line(0.687 * w, 0.97 * h, 0.694 * w, 0.97 * h);
    line(0.753 * w, 0.97 * h, 0.760 * w, 0.97 * h);
    line(0.7565 * w, 0.965 * h, 0.7565 * w, 0.975 * h);
    //The light up on hover is achieved using this, on hovering, just increase the stroke weight.
    if (mouseX > 0.7 * w && mouseX < 0.75 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
      strokeWeight(4); 
    
    int pos = (int)in.getGain();
    int len = 0;
    line(0.7 * w, 0.97 * h, map(pos, -40, len, 0.70 * w, 0.75 * w ), 0.97 * h);
  }
  
  void playButton()
  {
    strokeWeight(2); 
    if (mouseX > 0.49 * w && mouseX < 0.51 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
      strokeWeight(4); 
    pushMatrix();
      translate(w/2, 0.97 * h);
      triangle(8, 0, -2, 8, -2, -8);
    popMatrix();
  }
  
  void pauseButton()
  {
    strokeWeight(2); 
    if (mouseX > 0.49 * w && mouseX < 0.51 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
      strokeWeight(4); 
    pushMatrix();
      translate(w/2, 0.97 * h);
      rectMode(CENTER);
      rect(-4, 0, 1, 15);
      rect(4, 0, 1, 15);
    popMatrix();
  }
  
  void nextButton()
  {
    strokeWeight(2); 
    if (totalSize == 0 || fileIndex == totalSize - 1)
      stroke(channelColor[0], uiAlpha/2);
    if (mouseX > 0.54 * w && mouseX < 0.56 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
      strokeWeight(4); 
    
    pushMatrix();
      translate(0.55*w, 0.97 * h);
      rectMode(CENTER);
      triangle(0, 0, -8, 8, -8, -8);
      triangle(8, 0, 0, 8, 0, -8);
      rect(9, 0, 2, 16);
    popMatrix();
     
  }

  void prevButton()
  {
    strokeWeight(2); 
    if (totalSize == 0 || fileIndex == 0)
       stroke(channelColor[0], uiAlpha/2);
    if (mouseX > 0.44 * w && mouseX < 0.46 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
     strokeWeight(4); 
     
    pushMatrix();
      translate(0.45*w, 0.97 * h);
      rectMode(CENTER);
      rotate(PI);
      triangle(0, 0, -8, 8, -8, -8);
      triangle(8, 0, 0, 8, 0, -8);
      rect(9, 0, 2, 16);
    popMatrix();
  }

  void closeButton()
  { 
    strokeWeight(2); 
    if (mouseX > 0.915 * w && mouseX < 0.925 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
     strokeWeight(4); 
   
    pushMatrix();
      rectMode(CENTER);
      translate(0.92 * w, 0.97 * h);
      rotate(PI/4);
      line(0, 10, 0, -10);
      rotate(PI/2);
      line(0, 10, 0, -10);
    popMatrix();
  }

  void sizeButton()
  {
    strokeWeight(2); 
    if (mouseX > 0.885 * w && mouseX < 0.905 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
     strokeWeight(4); 
    
    pushMatrix();
      rectMode(CENTER);
      translate(0.90 * w -5, 0.97 * h);
      rect(0, 0, 10, 10);
      rect(-3, 3, 10, 10);
    popMatrix();
  }
  
    void darkButton()
  {
    strokeWeight(2); 
    if (mouseX > 0.055 * w && mouseX < 0.065 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
     strokeWeight(4); 
    
    pushMatrix();
      rectMode(CENTER);
      if(darkMode)
      noFill();
      else
      fill(channelColor[0], uiAlpha);
      translate(0.06 * w , 0.97 * h);
      ellipse(0, 0, 16, 16);
    popMatrix();
  }
  
   void nextVisualButton()
  {
    strokeWeight(2); 
    if (mouseX > 0.075 * w && mouseX < 0.090 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
     strokeWeight(4); 
    
    pushMatrix();
      noFill();
      translate(0.08 * w , 0.97 * h);
      line(0, 0, 20, 0);
      line(20, 0, 12, -8);
      line(20, 0, 12, 8);
    popMatrix();
  }
  
   void lockVisual()
  {
    strokeWeight(2); 
    if (mouseX > 0.10 * w && mouseX < 0.115 * w && mouseY > 0.965 * h && mouseY < 0.975 * h)
     strokeWeight(4); 
    
    pushMatrix();
      noFill();
      translate(0.105 * w + 10 , 0.97 * h - 10);
      rotateZ(PI/2);
      line(0, 0, 20, 0);
      line(20, 0, 12, -8);
      line(20, 0, 12, 8);
    popMatrix();
  }
  
  void displayMeta()
  {
    //Meta Data
    fill(channelColor[0], uiAlpha);
    textSize(50);
    textFont(font);
    if(uiAlpha > 0)
    {
        text(meta.title(), 0.05 * boundW, 0.07 * boundH);
        text(meta.author(), 0.05 * boundW, 0.12 * boundH + 10 ); 
        if(debug)
        {
             text(frameRate, 0.05 * boundW, 0.22 * boundH ); 
             text(allowChange, 0.056 * boundW, 0.26 * boundH + 20 ); 
        }
       
        int min = (int)pos/60000;
        text((int)pos/60000 + " : " + int(pos/1000 - min*60), 0.95 * boundW - 70, 0.09 * boundH);
    }
  }
   
}
 
  // Change size of window, resize visualizations accordingly.
  void changeSize()
  {
   toggle *= -1;
    if(toggle == 1)
    {
        boundW = displayWidth;
        boundH = displayHeight;
    } 
    else
    {
        boundW = 800;
        boundH = 600;
    }
   ui = new UI(boundW, boundH);
   initializeVisualizers();
  }
  

 
 // Force sketch to fullscreen on startup.
   boolean sketchFullScreen() {
       return true;
 }
