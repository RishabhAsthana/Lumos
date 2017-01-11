
 int allowChange = 1200;
 int visualizer = 0;
 int alpha = 255;
 int pAlpha = 255; 
 int pr = 0;
 int flip1 = 0;
 int flip2 = 0;

 void visual()
 {
   alpha = int(map(volAvg, 0 , maxVol, 0 , 255));
   if(alpha > pAlpha)
      pAlpha = alpha;
     
  // Web Visualizer
  if(visualizer == 0)
   {
    //smooth(2);
    for(int i = 0; i < N; i++)
    {
     for(int j = 1; j < N; j++)
       particles.get(i).link(particles.get(j));
    
       particles.get(i).run();
    }  
   }
   //Dot/Cirlce Panel Visualizer
   else if(visualizer == 1)
   {
    //smooth(4); 
    noStroke();
    pr = int(map(volAvg, 0 , maxVol, 0 , 600));
    pushMatrix();
     //a += map(volAvg, 0 , maxVol, -1 , 1);
      a += 2*0.098;
    c.display(map(volAvg, 0, maxVol, 0 ,60));
    popMatrix();
    if(pr> r)
    r = pr;
    r-=5;
   }
   //Sbar Visualizer
   else if(visualizer == 2)
   {
    stroke(channelColor[0]);
    float temp = map(mouseX, 0, boundW, 0, 5);
      println(temp);
         a += 0.001;
         inR = int(map(volAvg, 0 , maxVol, 100 , 200));
          if(pnR < inR)
           pnR = inR;
           b.innerR = pnR;
           b.display();
           pnR--;
   }
     /* else if(visualizer == 3)
   {       allowChange--;
           for(int i = 0; i < 3; i++)
           {
           inR = int(map(fft3Avgs[i], 0 , max3Channel[i], 0 , 180));
           if(barSpeakers.get(i).prevRad < inR)
             barSpeakers.get(i).prevRad = inR;
             stroke(channelColor[i+1]);
             barSpeakers.get(i).innerR = barSpeakers.get(i).prevRad;
             barSpeakers.get(i).display();
             barSpeakers.get(i).prevRad--;
           }
          
   }*/
   /*else if(visualizer == 4)
   {
    //smooth(4); 
    allowChange--;
    noStroke();
    float val = (map(volAvg, 0 , maxVol, p.h/2 , -p.h/2));
    p.display(val, channelColor[0]); 
   }*/
    /* else if(visualizer == 3)
   {
    noStroke();
    int h = panels[0].h/2;
    for(int i = 0; i < 3; i++)
    {
    //float val = (map(fft3Avgs[i], 0 , max3Channel[i], p.h/2 , -p.h/2));
    float val = (map(fft3Avgs[i], 0 , max3Channel[i], h , -h));
    panels[i].display(val, channelColor[i+1]);
    } 
   }*/
     else if(visualizer == 3)
   {
     pushMatrix();
     fill(channelColor[0], pAlpha);
     noStroke();
     translate(boundW/2, boundH/2);
     float sc = map(volAvg, 0 ,maxVol, 1 ,1.1);
     scale(sc);
     for(int i = 0; i < 10; i++)
     {
     rotateX(a);
     rotateZ(a);
     box(400);
    //ellipse(0, 0, size - i*(size/20), size - i*(size/20));
    } 
     //float size = map(volAvg, 0, maxVol, 400, 500);
     //box(size); 
   a += 0.01;
     popMatrix();
     pAlpha -= 10;
    /*noStroke();
    int h = panels[0].h/2;
    for(int i = 0; i < 11; i++)
    {
    //float val = (map(fftAvgs[i], 0 , maxChannel[i], p.h/2 , -p.h/2));
    float val = (map(fftAvgs[i], 0 , maxChannel[i], h , -h));
    panels12[i].display(val, channelColor[i]);
    } 
    //float val = (map(fftAvgs[10], 0 , maxChannel[11], p.h/2 , -p.h/2));
    float val = (map(fftAvgs[10], 0 , maxChannel[11], h , -h));
    panels12[11].display(val, channelColor[11]);*/
   }
   else if(visualizer == 4)
   {
    //smooth(2);
   // blendMode(ADD);
    if(darkMode)
    {
    strokeWeight(1);
    stroke(channelColor[0],pAlpha  );//pAlpha - 155
    inR = int(map(volAvg, 0 , maxVol, 0 , 600));
    if(pnR < inR)
    pnR += int(map(volAvg, 0 , maxVol, 0 , 50));;
   
    core.rad = pnR;
    core.display(a); 
   
    a += 2*0.098;
    pnR-=5;
    if(pnR < 0) pnR = 0;
    pAlpha -= 10;
   }
   else visualizer = (int)random(11);
    
   }
   else if(visualizer == 5)
   {
    t+=0.01;
    if(s < 0 || s > 1.0)
    flip *= -1;
    s += 0.001 * flip; 
    
    //if(visualizer == 6)
   // {
    r1.display(map(fft3Avgs[0], 0 , max3Channel[0], 0 , 800), channelColor[0], map(fft3Avgs[0], 0 , max3Channel[0], 0 , 200));
    r2.display(map(fft3Avgs[1], 0 , max3Channel[1], 0 , 800), channelColor[1], map(fft3Avgs[1], 0 , max3Channel[1], 0 , 200));
    r3.display(map(fft3Avgs[2], 0 , max3Channel[2], 0 , 800), channelColor[2], map(fft3Avgs[2], 0 , max3Channel[2], 0 , 200));
   // }
   // else
   // r4.display(map(volAvg, 0 , maxVol, 0 , 1200), channelColor[0]); 
   allowChange--;
   }
   else if(visualizer == 6 )
   {
    
     
  /*  blendMode(BLEND);
    pushMatrix();
    translate(-110,-100,-100);
    fill(0, 10);
    rect(0,0,2 * width, 2 * height);
    popMatrix();*/
    stroke(channelColor[0], pAlpha);
    noFill();
    float scale = map(volAvg, 0 , maxVol, 1 , 1.1);
    //if(visualizer == 10)      rSphere.display(5, true, true, true); 
    //rSphere.display(scale, true, true, true); //fff ttt 
    
    //else                      rSphere.display(5, true, false, false);
//    stroke(channelColor[1], pAlpha);
    rSphere2.display(scale, false, true, true);
    stroke(channelColor[1], pAlpha);
    rSphere3.display(scale + 4, false, true, true);
    //rSphere4.display(scale + 4, true, true, true);
   }
   else if(visualizer == 7)
   {
    strokeWeight(1);
    lorenz.display(); 
   }
   else if(visualizer == 8)
   {
    blendMode(BLEND);
    pushMatrix();
    translate(-110,-100,-100);
    fill(0, 10);
    rect(0,0,2 * width, 2 * height);
    popMatrix();
    field.display();
   }
   else if(visualizer == 9)
   {
    blendMode(BLEND);
    pushMatrix();
    translate(-110,-100,-100);
    fill(0, 10);
    rect(0,0,2 * width, 2 * height);
    popMatrix();
    lissajous.display();
    pAlpha -= 10;
   }
   else if(visualizer == 10)
   {
    pushMatrix();
    stroke(channelColor[0], pAlpha);
    noFill();
    translate(boundW/2, boundH/2);
    rectMode(CENTER); 
    float sc = map(volAvg, 0 ,maxVol, 1 ,1.6);
    scale(sc);
    for(int i = 1; i < 100; i++)
    {
    if(flip2 == 0)  rotateZ(a);
    else if(flip2 == 1)  rotateY(a);
    else if(flip2 == 2)  rotateX(a);
    else 
    {
      rotateZ(a);
      rotateX(a);
    }
    
    if(flip1 == 0)
    rect(0, 0, 800 - (i * 8), 800- (i * 8));
    else  ellipse(0, 0, 800 - (i * 8), 800- (i * 8));
    
    
   }
   a += 0.01;
   pAlpha -= 10;
    popMatrix();
   }
   
   
   pAlpha--;
 }
 
 void initializeVisualizers()
 {
  particles = new ArrayList<Particle>();
  for(int i = 0; i < N; i++)
  particles.add(new Particle(int(random(width)), (int)random(height)));
  
  c = new cPanel(0, 0, boundW, boundH);
  
  b = new BarSpeaker(boundW/2, boundH/2, 100, 300);
  
  barSpeakers = new ArrayList<BarSpeaker>(); 
 
  barSpeakers.add(new BarSpeaker(int(boundW * 0.20), boundH/2, 100, 180));
  barSpeakers.add(new BarSpeaker(int(boundW * 0.50), boundH/2, 100, 180));
  barSpeakers.add(new BarSpeaker(int(boundW * 0.80), boundH/2, 100, 180));
  
  //p = new panel(boundW/2, boundH/2, boundW, boundH);
  
  panels = new panel[3];
  panels[0] = new panel(int(boundW * 0.18) , boundH/2, boundW/3 - 9, boundH);
  panels[1] = new panel(int(boundW * 0.50) , boundH/2, boundW/3 - 9, boundH);
  panels[2] = new panel(int(boundW * 0.82) , boundH/2, boundW/3 - 9, boundH);
  
  panels12 = new panel[12];
  for(int i = 0; i < 12; i++)
  {
   panels12[i] = new panel((boundW/12 * i) + (boundW/12)/2  , boundH/2, boundW/12 +10 , boundH);
  }
  
  core = new Core(boundW/2, boundH/2);
  
  r1 = new RingSpeaker(int(0.15 * boundW), int(0.50 * boundH), 50);
  r2 = new RingSpeaker(int(0.50 * boundW), int(0.50 * boundH), 50);
  r3 = new RingSpeaker(int(0.85 * boundW), int(0.50 * boundH), 50);
  r4 = new RingSpeaker(int(0.50 * boundW), int(0.50 * boundH), 150);
  
  rSphere = new RingSphere(boundW/2, boundH/2, 300);
  rSphere2 = new RingSphere(boundW/2, boundH/2, 300);
  rSphere3 = new RingSphere(boundW/2, boundH/2, 300);
  rSphere4 = new RingSphere(boundW/2, boundH/2, 300);
  
  lorenz = new Attractor();
  
  field = new Field();
  
  lissajous = new Lissajous();
 
 }
