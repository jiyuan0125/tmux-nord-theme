#!/bin/bash
nord_black="#3C4D68"
nord_blue="#81A1C1"
nord_deep_blue="#88C0D0"
nord_yellow="#EBCB8B"
nord_white="#ECEFF4"
nord_green="#A3BE8C"
nord_visual_grey="#E5E9F0"
nord_comment_grey="#E5E9F0"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$nord_white"
set "message-bg" "$nord_black"

set "message-command-fg" "$nord_white"
set "message-command-bg" "$nord_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$nord_black"
setw "window-status-bg" "$nord_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$nord_black"
setw "window-status-activity-fg" "$nord_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$nord_comment_grey"
set "window-active-style" "fg=$nord_white"

set "pane-border-fg" "$nord_white"
set "pane-border-bg" "$nord_black"
set "pane-active-border-fg" "$nord_green"
set "pane-active-border-bg" "$nord_black"

set "display-panes-active-colour" "$nord_yellow"
set "display-panes-colour" "$nord_blue"

set "status-bg" "$nord_black"
set "status-fg" "$nord_white"

time_format=$(get "@nord_time_format" "%R")
date_format=$(get "@nord_date_format" "%Y-%m-%d")

set "@prefix_highlight_fg" "$nord_black"
set "@prefix_highlight_bg" "$nord_yellow"
set "@prefix_highlight_copy_mode_attr" "fg=$nord_visual_grey,bg=$nord_yellow"
set "@prefix_highlight_output_prefix" "« "
set "@prefix_highlight_output_suffix" " "

set "status-right" "#{prefix_highlight}#[fg=$nord_visual_grey,bg=$nord_black]«#[fg=$nord_black,bg=$nord_blue] ${date_format} ${time_format} #[fg=$nord_green,bg=$nord_blue]«#[fg=$nord_black,bg=$nord_deep_blue] #h "
set "status-left" "#[fg=$nord_black,bg=$nord_deep_blue] #S #[fg=$nord_visual_grey,bg=$nord_black]»"

set "window-status-format" "#[fg=$nord_black,bg=$nord_blue] #I » #W #[fg=$nord_visual_grey,bg=$nord_black]»"
set "window-status-current-format" "#[fg=$nord_black,bg=$nord_green,bold] #I » #W #[fg=$nord_visual_grey,bg=$nord_black]»"
