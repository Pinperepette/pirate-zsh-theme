#  The Pirate theme for zsh
# 256 COLORS - CHEAT SHEET

triangolo_dx() {
   echo $'\ue0b0'
}

indicatore_promt() {
   echo $'%B\u276f%b'
}

freccia_avvio() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

freccia_culo() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(triangolo_dx)%{$reset_color%}"
}

user_normale() {
   # colore testo
   ARROW_FG="016"

   # colore corpo
   ARROW_BG="226"
   # colore freccia
   NEXT_ARROW_FG="226"

   # colore freccia x parte seguente
   NEXT_ARROW_BG="239"
   echo "$(freccia_avvio) %n $(freccia_culo)"
}

user_in_altre_situa() {
   ARROW_FG="016"

   ARROW_BG="197"
   NEXT_ARROW_FG="197"

   NEXT_ARROW_BG="239"
   echo "$(freccia_avvio) %n $(freccia_culo)"
}

# controllo user situa
username() {
   echo "%(?.$(user_normale).$(user_in_altre_situa))"
}

cartella() {
   ARROW_FG="226"

   ARROW_BG="239"
   NEXT_ARROW_FG="239"

   NEXT_ARROW_BG="255"
   echo "$(freccia_avvio) %2~ $(freccia_culo)"
}

orologio() {
   echo "%{$fg[green]%}%*%{$reset_color%}"
}

git_prompt() {
   ARROW_FG="016"

   ARROW_BG="255"
   NEXT_ARROW_FG="255"

   NEXT_ARROW_BG=""
   
   echo "$(freccia_avvio) $(git_prompt_info) $(freccia_culo)"
}

# GIT
ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='$(username)$(cartella)$(git_prompt)
$(indicatore_promt) '
RPROMPT='$(git_prompt_status) $(orologio)'
