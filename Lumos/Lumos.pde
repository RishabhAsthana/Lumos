
 void setup()
 {
  size(displayWidth, displayHeight, P3D); 
  frame.setResizable(true);
  frameRate(60);
  
  dh = new DisposeHandler(this);
  files = new ArrayList<String>();
  drop = new SDrop(this);
  try
  {
    robot = new Robot();
  }
  catch (AWTException e)
  {
    println("Robot class not supported by your system!");
    //exit();
  }
  
  boundW = displayWidth;
  boundH = displayHeight;
  ui = new UI(width, height);
  font = loadFont("SourceSansPro-Regular-50.vlw");
  
  minim = new Minim(this);
  in = minim.loadFile("D1.mp3", 1024);
  in.loop();
  meta = in.getMetaData();
  fft = new FFT(in.bufferSize(), in.sampleRate());
  fft.logAverages(11, 1);
  beat = new BeatDetect();
  
  cosTable = new float[bsize];
  sinTable = new float[bsize];
  for (int i = 0; i < bsize; i+= 8)
  { 
    cosTable[i] = cos(i * TWO_PI/bsize);
    sinTable[i] = sin(i * TWO_PI/bsize);
  }
  
  initializeColorArrays();
  initializeVisualizers();
 }
 
 void draw()
 {
   
   println(in.hasControl(Controller.VOLUME));
   blendMode(ADD);
   totalSize = files.size();
   //if(blackMode)
  // background(back);
   //else
   if(visualizer != 8 && visualizer != 9  )
   background(back);
   smooth(4); 
   audioStep();
   colorStep();
   visual();
  // 

   hint(DISABLE_DEPTH_TEST);
 //rect(0, 0, width, height);
   ui.display();
   change();
   hint(ENABLE_DEPTH_TEST);
   allowChange--;
   
   //println(visualChosen);
 }
 

 

