# adds env vars for docker-compose
alias docker-compose="CURRENT_UID=$(id -u):$(id -g) DOCKERHOST=$(ifconfig | grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1) docker-compose"

alias dclog="docker-compose logs --follow"
alias dcexec="docker-compose exec"
alias dcfull="docker-compose -f full-docker-compose.yml"
