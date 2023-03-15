What is the project for? 

The project is in place in order to build software that helps automate activities that include
audio/visual media processing.


The software is a CLI app is called Multi Media Workstation (MMW). MMW is split
in to two main sections, the Digital Audio Workstation (DAW) and Image processing (IP) 

How is MMW used?

The user can arranges and write their the music in a .ly file. 

The MMW DAW will compile the .ly file and produce a .pdf for the sheet music, a .midi.

Each instument written to the sheet music is allocated its own channel in the midi file.
The midi file is then processed by a .csd file. The .csd file is where the user can design  
the sound for each instrument they've arranged in the .ly score.

For the user the hear the music the .mix file where the sounds can be produced.

The user can use .mix to tell the software how, where and when they want to here the music.

As a use case example I'm going to break down my approach to what I'm currently working on to describe the users perspective.
At the moment the user must edit a file(s) then hear it back. And this is a principle pattern of
working with MMW. Instruction then process, instruction process and so on.

The user may want to hear from 12 bars in, up to 24 bars and have that section looped 4 times.
This is written as an instruction written into .mix then MMW will perform the task

Next the user may want the same again but also monitor a microphone input channel and write it
to a file with some eq, reverb and delay. To tell MMW where/what file to record into the user must edit the .rec file.

This use case has servral vocal takes. I use .mix to tell MMW  where and which vocals to playback.
.mix

Requirements
The user needs to tell subtitles MMW when to print the screen.
Lyrics could be written to .ly then the midi file could help generate the time to print the subtitles to screen.
This may also allow the user to make any tweaks to the midi note if required.
