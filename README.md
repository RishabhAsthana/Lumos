# Lumos
A lightweight audio-reactive visualizer, with a custom UI made from scratch in Processing.

An old project made entirely in Processing 2, uses external libraries SDrop by Andreas Schlegel, and Minim by Damien Di Fede.

The visualizer starts immediately with a sample track (Sail : Awolnation, as I don't stand to profit from this, I hope the copyright is not 
tampered anyhow :) ). The user can drag and drop any .mp3 files into the visualizer window which will be accepted and cycled through from
the UI itself.

The UI is minimalistic and straight forward to use, however user can press X to skip the current visualization, C to hold the visualization
an extended (limited) period and Z to display frames per second being rendered and time before next switch. 

Visuals and colors change over beats detected by Minim, and properties of visuals and their aesthetics are influenced by using information
provided by the Fast Fourier Transform (Logarithmic to better represent human hearing) of the waveform. 

The visulizer runs at consistent 60fps on 1080p resolution on an HD4000. No further plans to improve this, the code is old and reflects
some bad practices I followed. I'll make another one probably in near future that should be much better.
