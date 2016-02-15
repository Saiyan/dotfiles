
export LC_ALL="de_DE.UTF-8"

alias l='ls -al --color=auto' 

#Zeitzone für $(date)
export TZ=CET-1CEST


function cur_time(){
    echo "$(date +'%T')"
}

function GITSTUFF(){
    if [ -d ".git" ] && [ -f ".git/HEAD" ];then
        #echo -e "\e[1;33m$(__git_ps1):\e[0;31m$(git rev-parse --verify --short HEAD) "
        branch=$(git rev-parse --abbrev-ref HEAD)
        echo -e "──(\e[1;33m$branch:\e[31m$(git rev-parse --verify --short HEAD)\e[0;0m)\n"
	printf "\n"
    fi
}

# Dieses Zeile ändert die Bash-Prompt und zeigt den derzeitigen Branch rot an um ihn gleich beim öffnen der Bash zu erkennen und eventuellen Verwechslungen vorzubeugen.
#PS1='\[\e[31m\]┌─\[\e[32m\]\u\[\e[35m\]@\H\[\e[31m\]────\[\e[1;33m\] `cur_time` \[\e[0;31m\]────[\[\e[1;36m\]\w \n\[\e[1;33m\]`GITSTUFF`\[\e[31m\]\[\e[0m\]\$ '
PS1='\[\e[1;0m\]┌─(\[\e[1;33m\]`cur_time`\[\e[1;0m\])─(\[\e[36m\]\w\[\e[1;0m\])\n\[\e[0m\]├─(\[\e[32m\]\u\[\e[35m\]@\H\[\e[0m)`GITSTUFF`\n\[\e[31m\]\[\e[0m\]└─\$ '
