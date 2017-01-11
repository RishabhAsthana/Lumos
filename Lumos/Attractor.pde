Attractor lorenz;

 class Attractor {
   
   float x, y, z, a, b, c;
   float dt = 0.035;
   float nx, ny, nz;
   float angle = 0;
   int scale = 100;
   float v = 0;
   PVector[] positions;
   
   Attractor()
   {
     x = 1;
     y = 1;
     z = 1;
     a = 5;
     b = 15;
     c = 1;
     positions = new PVector[10000];
     for(int i = 0; i < positions.length; i++)
     positions[i] = new PVector(0, 0,0);
   }
   
   void update()
   {
    a = map(volAvg, 0  ,maxVol, 1 ,8);  //1-50
    b = map(volAvg, 0  ,maxVol, 13 ,20);
    c = map(volAvg, 0  ,maxVol, 1 ,5);
    dt = map(volAvg, 0 ,maxVol, 0.020 ,0.040);
   //scale = (int)map(volAvg, 0 , maxVol, 0, 120);
    if(frameRate < 35)
    allowChange--;
   }
   
   void display()
   {
    pushMatrix();
    translate(boundW/2, 2 * boundH ,  -2250);
    rotateX(PI/2);
    update();
    calculatePositions();

    rotateZ(-angle);
 
   if(Float.isNaN(positions[0].x))
    {
    x = 1;
    y = 1;
    z = 1; 
    }
  
    //fill(255, 50);
    stroke(channelColor[0], 255);
 
    for(int i = 0; i < positions.length - 1; i++)
        line(scale * positions[i].x, scale *positions[i].y, scale *positions[i].z,
                   scale * positions[i+1].x, scale * positions[i+1].y, scale * positions[i+1].z);
    angle += map(volAvg, 0 ,maxVol, 0.01 ,0.1);
 
 popMatrix();
   }
   
   void calculatePositions()
 {
   for(int i = 0; i < positions.length; i++)
     {
      nx = x - (a * x * dt) + (a * y * dt);
      ny = y + (b * x * dt) - (y * dt) - (z * x * dt);
      nz = z - (c * z * dt) + (x * y * dt);
      
      positions[i].x = nx; 
      positions[i].y = ny;
      positions[i].z = nz;
      
      x = nx;
      y = ny;
      z = nz;
     } 
 }

 }
