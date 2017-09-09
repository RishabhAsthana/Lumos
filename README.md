# Lumos
A lightweight audio-reactive visualizer, with a custom UI made from scratch in Processing.

An old project made entirely in Processing 2, uses external libraries SDrop by Andreas Schlegel, and Minim by Damien Di Fede.

## Usage
The user can drag and drop any .mp3 files into the visualizer window which would add them to the playlist

## Additional Controls
The UI is minimalistic and straight forward to use, user can also press X to skip the current visualization, C to hold the visualization
an extended (limited) period and Z to display frames per second being rendered and time before next switch. 

The visualizer runs at consistent 60fps on 1080p resolution on onboard gpu (Tested as low as i5 3337u). No further plans to improve this, the code is old and reflects
some bad practices I followed. I plan to make a another one, which would run on WebGL, solving the portability problem of this one.
