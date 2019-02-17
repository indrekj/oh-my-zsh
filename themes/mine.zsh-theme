PROMPT=$'$(user)@$(host)$(prompt_info) $(tilde) '
RPROMPT=' %~'

tilde() {
  echo "%{\e[1;38;5;33m%}~%{$reset_color%}"
}

user() {
  echo "%n";
}

host() {
  echo "%{\e[1;39;5;35m%}%m%{$reset_color%}";
}

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

hg_prompt_info() {
  echo `hg branch 2>/dev/null`
}

rvm_version() {
  gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  if [ "$gemset" != "" ] && [ "$version" != "" ]; then
    echo "$version%%$gemset"
  fi
}

prompt_info() {
  git=$(git_prompt_info)
  hg=$(hg_prompt_info)

  if [ "$git" != "" ]; then
    rvm=$(rvm_version)
    if [ "$rvm" != "" ]; then
      echo " %{$fg[green]%}[$git $rvm]"
    else
      echo " %{$fg[green]%}[$git]"
    fi
  elif [ "$hg" != "" ]; then
    echo " %{$fg[red]%}[$hg]"
  fi
}
