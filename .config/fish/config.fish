# Paths
#set PATH ~/.composer/vendor/bin $PATH
set -g -x PATH /usr/local/bin $PATH

# Git
set __fish_git_prompt_show_informative_status 1
set __fish_git_prompt_showupstream "informative"

# Colors
set __fish_git_prompt_color_branch         magenta
set __fish_git_prompt_color_cleanstate     green
set __fish_git_prompt_color_dirtystate     brown
set __fish_git_prompt_color_invalidstate   red
set __fish_git_prompt_color_stagedstate    cyan
set __fish_git_prompt_color_untrackedfiles yellow
set __fish_git_prompt_color_upstream       cyan

# Icons
set __fish_git_prompt_char_cleanstate      "✓"
set __fish_git_prompt_char_conflictedstate "!"
set __fish_git_prompt_char_dirtystate      "*"
set __fish_git_prompt_char_stagedstate     "+"
set __fish_git_prompt_char_untrackedfiles  "%"
set __fish_git_prompt_char_upstream_ahead  "↑"
set __fish_git_prompt_char_upstream_behind "↓"
set __fish_git_prompt_char_upstream_prefix "|"

# Enable vim mode
fish_vi_key_bindings

# Prompt
function prompt_pwd --description 'Print the current working directory, NOT shortened to fit the prompt'
 if test "$PWD" != "$HOME"
  printf "%s" (echo $PWD|sed -e 's|/private||' -e "s|^$HOME|~|")
 else
  echo '~'
 end
end

# Colors
set __fish_git_prompt_color_branch         magenta
set __fish_git_prompt_color_cleanstate     green
set __fish_git_prompt_color_dirtystate     brown
set __fish_git_prompt_color_invalidstate   red
set __fish_git_prompt_color_stagedstate    cyan
set __fish_git_prompt_color_untrackedfiles yellow
set __fish_git_prompt_color_upstream       cyan

# Icons
set __fish_git_prompt_char_cleanstate      "✓"
set __fish_git_prompt_char_conflictedstate "!"
set __fish_git_prompt_char_dirtystate      "*"
set __fish_git_prompt_char_stagedstate     "+"
set __fish_git_prompt_char_untrackedfiles  "%"
set __fish_git_prompt_char_upstream_ahead  "↑"
set __fish_git_prompt_char_upstream_behind "↓"
set __fish_git_prompt_char_upstream_prefix "|"

# Greeting
function fish_greeting
  #set_color -o 268bd2
  #echo (date +%H:%M)" -!- friend_ [friend_@] has joined #fsociety"
  #set_color -o 268bd2
  #echo -n (date +%H:%M)" <mr. robot> "
  #set_color -o FFFFFF
  #echo "Hello friend."
end

# Prompt
# Ends up looking like this:
#
# [user@hostname] [~/projects/project-name] (master|%1)
# $
#
# 💀
#
function fish_prompt
 set last_status $status
 set_color -o red
 echo ""
 printf '['
 set_color normal
 printf (whoami)'@'(hostname)
 set_color -o red
 printf '] ['
 set_color $fish_color_cwd
 printf '%s' (prompt_pwd)
 set_color -o red
 printf ']'
 set_color normal
 printf '%s ' (__fish_git_prompt)
 echo ""
 printf '$ '
end

# Z
. ~/.config/fish/z.fish

# Aliases
alias cleanswp "find ./ -type f -name '\.*sw[klmnop]' -delete"
alias defcon "mplayer -playlist http://somafm.com/defcon.pls -softvol"
alias ga "git add"
alias gc "git commit"
alias gst "git status"
alias tmux "tmux -2"
