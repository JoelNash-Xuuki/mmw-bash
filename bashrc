#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH="$HOME/test/bats/bin:$PATH"

bats test/mmw-config.bats 
bats test/mmw.bats  
bats test/mmw-score.bats 
bats test/mmw-sound-design.bats 

echo "Yah baby, where the party at homie?!"
echo "After the follwoing step check your 'Documents' folder."
echo "Type 'exit' + enter."
