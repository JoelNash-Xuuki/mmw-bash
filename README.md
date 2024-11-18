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



 
