function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}

# local time, color coded by last return code
time_enabled="[%(?.%{$fg[cyan]%}.%{$fg[red]%})%*%{$reset_color%}]"
time_disabled="[%{$fg[cyan]%}%*%{$reset_color%}]"
local time=$time_enabled

# user part, color coded by privileges
local user="%(!.%{$fg[green]%}.%{$fg[green]%})%n%{$reset_color%}"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
local host="@%{$fg[red]%}%m%{$reset_color%}"

# Compacted $PWD
local pwd="%{$fg[cyan]%}%(!.%1~.%~)%{$reset_color%}"

#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n%{$reset_color%}@)%{$fg[red]%}%m %{$fg_bold[cyan]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '
PROMPT='${time} ${user} ${pwd} $(git_prompt_info) $(git_remote_status)
%{$fg[red]%}%_$(prompt_char) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=true

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_PREFIX="%{$fg[blue]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}*%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" ↑"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE_COLOR=%{$fg[green]%}

ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" ↓"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE_COLOR=%{$fg[yellow]%}

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
local return_code=$return_code_enabled

RPS1='${return_code}'
