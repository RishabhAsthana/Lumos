/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: Lumos.pde
  Function: Initializes everything and synchronizes all the other modules
*/

 // This function initializes everything
 void setup()
 {
  // Set size to be dimensions of active display
  size(displayWidth, displayHeight, P3D);     
  frame.setResizable(true);
  frameRate(60);
  
  // Dispose handler is required for proper clean up
  dh = new DisposeHandler(this);
  // The 'files' array list stores paths to the audio tracks dropped in by the user
  files = new ArrayList<String>();
  drop = new SDrop(this);
  // The Robot object is used to mimic user mouse movement over long intervals so that the screen doesn't sleep
  try
  {
    robot = new Robot();
  }
  catch (AWTException e)
  {
    println("Robot class not supported by your system!");
  }
  
  // The bounds for UI
  boundW = displayWidth;
  boundH = displayHeight;
  ui = new UI(width, height);
  font = loadFont("SourceSansPro-Regular-50.vlw");
  
  // Setting up the audio library
  minim = new Minim(this);
  in = minim.loadFile("D1.mp3", 1024);
  in.loop();
  meta = in.getMetaData();
  fft = new FFT(in.bufferSize(), in.sampleRate());
  // We use log averages to better mimic human auditory range
  fft.logAverages(11, 1);
  beat = new BeatDetect();
  
  // Precomputing these trig values, since we use them a lot
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
 
 // This function executes every frame
 void draw()
 {
   
   // DEBUG: println(in.hasControl(Controller.VOLUME));
   blendMode(ADD);
   totalSize = files.size();

   // Some visualizers looked better with the trailing effect   
   if(visualizer != 8 && visualizer != 9  )
     background(back);

   smooth(4); 
   audioStep();
   colorStep();
   visual();
  
   // We want the UI to float over visuals, hence we temporarily disable DEPTH_TEST
   hint(DISABLE_DEPTH_TEST);
   ui.display();
   change();
   hint(ENABLE_DEPTH_TEST);
   allowChange--;
   
 }
 

 

