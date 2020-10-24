# adds env vars for docker-compose
# alias docker-compose="DOCKERHOST=$(ip -4 addr show docker0 | grep -Po 'inet \K[\d.]+') SSH_PRIVATE_KEY=\"$(cat ~/.ssh/id_rsa)\" docker-compose"

alias dcexec="docker-compose exec"
alias dclog="docker-compose logs --follow"
alias dcps="docker-compose ps"
alias dcfull="docker-compose -f full-docker-compose.yml"
