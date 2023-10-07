Multi Media Workstation (MMW) Project
The Multi Media Workstation (MMW) is a command-line software that brings automation to audio/visual media processing. 
It comprises two main components: the Digital Audio Workstation (DAW) and the Image Processing (IP).

Digital Audio Workstation (DAW)
The DAW allows users to arrange and write their music in a .ly file. 
The DAW compiles the .ly file, producing a .pdf for sheet music and a .midi. 
Each instrument written to the sheet music is allocated its own channel in the midi file. 
The midi file is then processed by a .csd file. The .csd file is where users can design the sound 
for each instrument they've arranged in the .ly score. To hear the music, users utilize a .mix file 
to instruct the software on how, where, and when the music should be played.

Image Processing (IP)
The IP handles the visual aspects of MMW, including features like subtitles. Lyrics can be written 
to a .ly file, and the midi file can generate the timings for printing the subtitles on the screen. 
This also allows users to make any tweaks to the midi notes if required.

How It Works
The MMW program works in three main parts: Project File Management, Audio Processing, and Image Processing.

Project File Management
This part is handled by the ProjectFileManager class. It reads project configuration files and extracts useful metadata like the sample rate. It also provides functionality for creating directories for storing project data.

Audio Processing
This part is handled by the AudioEngine class. It uses the Csound library to perform various audio operations like playing and rendering audio. It also allows reading audio files and extracting their contents into a string for further processing.

Image Processing
Image Processing allows for the creation of visual elements in sync with the audio. It is responsible for elements such as subtitles, timings, and other visual elements that may be required for a multimedia project.

Usage
The user edits a file(s), then MMW processes it. This is a fundamental pattern of working with MMW. MMW supports instruction-based processing, meaning that you write instructions into a .mix file, and MMW performs the tasks as per the instructions.

For example, if a user wants to hear from 12 bars in, up to 24 bars, and have that section looped 4 times, they can write this as an instruction in the .mix file. MMW will perform this task accordingly.

MMW also supports multi-track recording. Users can monitor a microphone input channel and record it to a file with specified effects, such as EQ, reverb, and delay. Users write instructions for this in a .rec file, specifying where/what file to record into.

Building and Running the Program
TODO: Add instructions for building and running the program.

Contributing
Contributions are welcome. Please fork the repository and create a pull request with your changes.

NOTES
The user needs a stable workflow.

aplay -D plughw:1,0 file.wav


#How to run tests
in the home dir of the repo run the following binery to run the tests.s
./test/bats/bin/bats --tap test/test.bats

#rm $HOME/audio/Vyvn/Flock/1/$PROJ.wav
  #csound -d -o$HOME/audio/Vyvn/Flock/1/$PROJ.wav -F\ 
  #  $HOME/projects_/flock/tmp/$PROJ.mid $HOME/projects_/flock/src/sound-design/$PROJ.orc \ 
  #  $HOME/projects_/flock/src/sound-design/$PROJ.sco

projSco="
    f0 $LENGTH
    t 0 $TEMPO
    a 0 0 0
    f1 0 1024 10 1
    f2 0 1024 10 1 0.5 0.3 0.25 0.2 0.167 0.14 0.125 .111
    f3 0 1024 10 1 0   0.3 0    0.2 0     0.14 0     .111   ; Square with a small amount of data
    f4 0 1024 10 1 1   1   1    0.7 0.5   0.3  0.1      
  "

  echo "$projSco" > /home/joel/projects_/flock/src/sound-design/$PROJ.sco
  
}

you could desribe the mmw features. 
make sure test/functions validate data


To change a value in a CSV file and then check it using the `cut` command, you can follow these steps:

1. Open the CSV file in a text editor or use a command-line text manipulation tool like `sed` or `awk`.
2. Locate the line that contains the value you want to change.
3. Modify the value as desired.
4. Save the changes to the CSV file.

For example, let's say you want to change the value in the second column of the third line in the `filename.csv` file. You can use the following command:

```bash
sed -i '3s/old_value/new_value/' filename.csv
```

This command uses `sed` with the `-i` option to edit the file in-place. It replaces the `old_value` with the `new_value` in the third line of the file.

After making the necessary changes, you can check the modified value using the `cut` command you mentioned:

```bash
cut -d ',' -f 2 filename.csv | sed -n 2p
```

This command will display the updated value in the second column of the CSV file.
