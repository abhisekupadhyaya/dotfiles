export PATH="/usr/local/opt/gettext/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/PostgreSQL/9.3/bin:/usr/bin"
##############################################################################
##The Script To Set and Unset Proxy for all Terminal applications.
function proxy_on(){
   proxy_server_address='172.16.2.30:8080'

   export http_proxy=http://$proxy_server_address
   export https_proxy=$http_proxy
   export ftp_proxy=$http_proxy
   export socks_proxy=$http_proxy
   export ALL_PROXY=$http_proxy

   export no_proxy="10.0.0.0/8,localhost,192.168.31.1,127.0.0.1,$USERDNSDOMAIN"

   # Update git to use the proxy
   git config --global http.proxy $http_proxy
   git config --global https.proxy $https_proxy
}

# Disable proxy settings
function proxy_off(){
   variables=( \
      "http_proxy" "https_proxy" "ftp_proxy" "socks_proxy" \
      "no_proxy" )

   for i in "${variables[@]}"
   do
      unset $i
   done

   git config --global --unset http.proxy
   git config --global --unset https.proxy
}

##############################################################################
##Add Colour to Bash
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'  
##############################################################################
proxy_on
# added by Miniconda3 4.7.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
