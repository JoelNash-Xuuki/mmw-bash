# Welcome to Multiple Media Workstation Suite (MMWS)

Package dependancies:
```bash
sudo pacman -S imagemagick
sudo pacman -S lilypond
sudo pacman -S ecasound
sudo pacman -S ffmpeg
sudo pacman -S csound
sudo pacman -S sox
sudo pacman -S bc
sudo pacman -S portmidi
```

Install yay/midicsv:
```bash
cd
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si
yay -S midicsv
```

Make scripts accessible to user. (Remember this step to test any changes)
```bash
sudo cp bin/mmw-config bin/mmw bin/ip.sh /usr/local/bin/
```

Run tests in following order
```bash
bats tests/mmw-config/mmw-config.bats
bats tests/mmw/mmw.bats
bats tests/mmw/mmw-score.bats
bats tests/mmw/mmw-sound-design.bats
```

```bash
bats tests/ip/ip.bats
bats tests/ip/overlay_a_specific_colour.bats
bats tests/ip/text-to-image-handling.bats
bats tests/ip/random-images.bats
bats tests/ip/moving-image.bats
```
Install Autotalent:
```
yay -S autotalent
```

Verify Installation:
Ensure the plugin is installed by listing LADSPA plugins:

```
listplugins | grep autotalent
```

# This table provides the note letter and frequency for each MIDI note from 0
to 88.

  MIDI Note   Note Letter   Frequency (Hz)  
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 
  0           C-1           8.18            
  1           C#-1/Db-1     8.66            
  2           D-1           9.18            
  3           D#-1/Eb-1     9.72            
  4           E-1           10.30           
  5           F-1           10.91           
  6           F#-1/Gb-1     11.56           
  7           G-1           12.25           
  8           G#-1/Ab-1     12.98           
  9           A-1           13.75           
  10          A#-1/Bb-1     14.57           
  11          B-1           15.43           
  12          C0            16.35           
  13          C#0/Db0       17.32           
  14          D0            18.35           
  15          D#0/Eb0       19.45           
  16          E0            20.60           
  17          F0            21.83           
  18          F#0/Gb0       23.12           
  19          G0            24.50           
  20          G#0/Ab0       25.96           
  21          A0            27.50           
  22          A#0/Bb0       29.14           
  23          B0            30.87           
  24          C1            32.70           
  25          C#1/Db1       34.65           
  26          D1            36.71           
  27          D#1/Eb1       38.89           
  28          E1            41.20           
  29          F1            43.65           
  30          F#1/Gb1       46.25           
  31          G1            49.00           
  32          G#1/Ab1       51.91           
  33          A1            55.00           
  34          A#1/Bb1       58.27           
  35          B1            61.74           
  36          C2            65.41           
  37          C#2/Db2       69.30           
  38          D2            73.42           
  39          D#2/Eb2       77.78           
  40          E2            82.41           
  41          F2            87.31           
  42          F#2/Gb2       92.50           
  43          G2            98.00           
  44          G#2/Ab2       103.83          
  45          A2            110.00          
  46          A#2/Bb2       116.54          
  47          B2            123.47          
  48          C3            130.81          
  49          C#3/Db3       138.59          
  50          D3            146.83          
  51          D#3/Eb3       155.56          
  52          E3            164.81          
  53          F3            174.61          
  54          F#3/Gb3       185.00          
  55          G3            196.00          
  56          G#3/Ab3       207.65          
  57          A3            220.00          
  58          A#3/Bb3       233.08          
  59          B3            246.94          
  60          C4            261.63          
  61          C#4/Db4       277.18          
  62          D4            293.66          
  63          D#4/Eb4       311.13          
  64          E4            329.63          
  65          F4            349.23          
  66          F#4/Gb4       369.99          
  67          G4            392.00          
  68          G#4/Ab4       415.30          
  69          A4            440.00          
  70          A#4/Bb4       466.16          
  71          B4            493.88          
  72          C5            523.25          
  73          C#5/Db5       554.37          
  74          D5            587.33          
  75          D#5/Eb5       622.25          
  76          E5            659.25          
  77          F5            698.46          
  78          F#5/Gb5       739.99          
  79          G5            783.99          
  80          G#5/Ab5       830.61          
  81          A5            880.00          
  82          A#5/Bb5       932.33          
  83          B5            987.77          
  84          C6            1046.50         
  85          C#6/Db6       1108.73         
  86          D6            1174.66         
  87          D#6/Eb6       1244.51         
  88          E6            1318.51         
                                            

 
