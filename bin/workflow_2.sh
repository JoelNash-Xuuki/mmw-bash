rm $HOME/.config/mmw.config
rm -r audio
rm -r Projects
mmw-config create
sed -i "s|PROJ=.*|PROJ=$1|g" $HOME/.config/mmw.config
$HOME/mmw/bin/mmw setProj Landing
#mmw setProjLoc Projects
#mmw setArtist Dev_1
#mmw-config addWAVDeclaration
#mmw setTempo 84
#mmw setDur 20
#mmw createProj
#mmw configRec 100 input_1 input_2 250 250
#mmw createLilyFile
#mmw createScorePDFAndMIDIFiles
#mmw buildInstrSoundDesignFiles
#mmw prodScoreAudio
#mmw makeTracks
#mmw prodTracks
#hb mvFileToSourceDir Projects/Landing/Landing.pdf
#mmw createSession
#clear
#history -c
#
#hb mvFileToSourceDir audio/Vyvn/Landing/stems/Landing.wav
#sheetbuilder Landing Xuuki Landing Vyvn scorepatch /home/vyvn
