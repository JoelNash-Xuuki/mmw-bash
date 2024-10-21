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

```bash
bats test/mmw-config/mmw-config.bats
bats test/mmw/mmw.bats 
bats test/mmw/mmw-score.bats 
bats test/mmw/mmw-sound-design.bats
```



 
