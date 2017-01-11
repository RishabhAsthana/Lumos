 
 // Global Variables
 
 color[] colors = { color(0, 102, 153), color(204, 102, 0) ,color(100,255,35), color(220,200,85),
 color(185,65,200), color(0,145,35), color(245,35,200) };
 //color[] colors = {color(255, 255, 255), color(76, 0, 153),  color(1, 1, 1) ,color(204,1,2), color(204,254,254) };
 color[] bw = {color(255, 255, 255), color(1, 1, 1) };

 color from = bw[1];
 color to = bw[0];  
 color[] fromChannelColor = new color[12];
 color[] toChannelColor = new color[12];
 color[] lastToChannelColor = new color[12];
 color[] channelColor = new color[12];
 
 void initializeColorArrays()
 {
    for(int i = 0; i < 12; i++)
    {
      fromChannelColor[i] = color(0, 0, 0);
      toChannelColor[i] = colors[(int)random(colors.length)];
      channelColor[i] = color(0, 0, 0);
    }
 }

 color lastTo = from;
 color back = from;
 
 boolean transitionComplete = true;
 boolean change = false;
 boolean darkMode = true;

 float inc = 0;
 
 void colorStep()
 {
  if(transitionComplete)
  {
    for(int i = 0; i < 12; i++)
   {
    fromChannelColor[i] = lastToChannelColor[i];
    toChannelColor[i] = colors[(int)random(colors.length)];
   }
    from = lastTo;
    to = -colors[(int)random(colors.length)] ;
    
    if(darkMode)
    to = bw[1] ;
    
    inc = 0;
  } 
  
  if(change)
 {
   for(int i = 0; i < 12; i++)
    {
      channelColor[i] = changeColor(fromChannelColor[i], toChannelColor[i]);
      inc -= 0.01;
    }
    back = changeColor(from, to);
   
 }  
 
 }
 
 // Smooth color change function
 color changeColor(color from, color to)
 {
  inc += 0.01;
  color inter = lerpColor(from, to, inc);
  transitionComplete = (inc < 1 ) ?  false :  true; 
  lastTo = to;
  for(int i = 0; i < 12; i++)
    lastToChannelColor[i] = toChannelColor[i];
    
  if(transitionComplete)
  change = false;
  return inter;
 }
 
 void changeColorSet()
 {
   
 }
