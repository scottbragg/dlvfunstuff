# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

declare -a CPA

# ARRAY
# 0 - red
# 1 - bright red
# 2 - bright white
CPA=("\e[0;31m" "\e[1;31m" "\e[1;37m")
colorpath() {
local N=$(pwd | tr -dc '/' | wc -c)
N=$[ $N - 1 ]
test $N -gt 2 && N=2
test $N -lt 0 && N=0
echo -en ${CPA[$N]}
}

#PS1='[\u@\h \[`colorpath`\]\w\[\e[0m]\]\$ '

#PS1='\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w \[\033[1;36m\]\$ \[\033[0m\]'
PS1="\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[`colorpath`\]\w \[\033[1;36m\] (\$(lsbytesum) Mb)]\$ \[\033[0m\]"
