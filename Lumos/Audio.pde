/*
  Author: Rishabh Asthana {asthana4@illinois.edu}
  File: Audio.pde
  Function: Mangages the Audio analysis and playback
*/ 
 import ddf.minim.*;
 import ddf.minim.analysis.*;
 
 Minim minim;
 AudioPlayer in;
 AudioMetaData meta;
 FFT fft;
 BeatDetect beat;
 
 // For some reason, I though eliminating function calls would result in speed up. May refactor this later.
 float[] fftAvgs = new float[11];
 float[] fft3Avgs = new float[3];
 float volAvg;
 int gain = 0;
 
 float maxVol = 3;

 // These array keep track of how high in amplitude a particular channel might have gone. This is necessary to scale the visuals according to the input audio properties
 float[] max3Channel = {3, 3, 3};
 float[] maxChannel = {
  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
 };
 
 // FFT parameters
 int bsize = 1024;
 float[] specVal;
 
 boolean paused = false;
 
 // This is executed for every frame
 void audioStep()
 {
  // We feed the FFT, and BeatDetect object a chunk of of audio stream
  fft.forward(in.mix);
  beat.detect(in.mix);
  
  //Calculate and store averages per channel
  for (int i = 0; i < 11; i++)
      fftAvgs[i] = fft.getAvg(i);
      
  fft3Avgs[0]   = (fftAvgs[0] + fftAvgs[1] + fftAvgs[2] + fftAvgs[3])/4;
  fft3Avgs[1]    = (fftAvgs[4] + fftAvgs[5] + fftAvgs[6] + fftAvgs[7])/4; 
  fft3Avgs[2] = (fftAvgs[8] + fftAvgs[9] + fftAvgs[10]) *2 ;
  
  volAvg = fft3Avgs[0] + fft3Avgs[1] + fft3Avgs[2] / 3;
  
  
  //Calculate maximum levels reached per channel
  // 12 Channels
  for (int i = 0; i < 11; i++)
  {
    float temp = fftAvgs[i];
    if (maxChannel[i] < temp)
      maxChannel[i] = temp;
  }
  maxChannel[11] = 10 + fftAvgs[10];
  
  // Single Channel
  if (maxVol < volAvg)
    maxVol = volAvg;
    
  // 3 Channels
  if (max3Channel[0] < fft3Avgs[0])
    max3Channel[0] = fft3Avgs[0];
  if (max3Channel[1] < fft3Avgs[1])
    max3Channel[1] = fft3Avgs[1];
  if (max3Channel[2] < fft3Avgs[2])
    max3Channel[2] = fft3Avgs[2];
    
   // Here we calculate the spectral values
   specVal = new float[bsize];
   for (int i = 0; i < bsize; i+=8 )
      specVal[i] = in.mix.get(i); 
  
  // Simple playlist loop  
  if (!in.isPlaying() && files.size() > 0 && paused == false)
  {
    fileIndex++;
    if (fileIndex == totalSize)
        fileIndex = 0;
    changeTracks(fileIndex);
  }
  
  if(beat.isOnset() == true)
  {
   change = true;
   alpha = 255;
   // We only transition into a new visual if there is a beat detected
   if(allowChange < 0)
     switching = true;
     
   // 'flipX' are parameters for a visualization. Will be refactored
   flip1++;
   flip2++;
   if(flip1 == 2) flip1 = 0;
   if(flip2 == 4) flip2 = 0;
      
    
  }
 }
