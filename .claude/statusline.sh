#!/usr/bin/env bash
# Status line: [dir](branch)|model effort|5h|W reset|.
# ANSI palette colours, so it follows the terminal theme (Tokyo Night).

c() { printf '\033[%sm%s\033[0m' "$1" "$2"; }

IFS=$'\x1f' read -r dir model effort ctx h5 d7 d7r < <(jq -r '
  def pct: if . == null then "" else round end;
  def eta: if . == null then "" else (. - now | floor) as $s
    | if $s <= 0 then ""
      elif $s >= 86400 then "\($s / 86400 | floor)d\($s % 86400 / 3600 | floor)h"
      elif $s >= 3600 then "\($s / 3600 | floor)h\($s % 3600 / 60 | floor)m"
      else "\($s / 60 | floor)m" end end;
  [ .workspace.current_dir // "",
    .model.display_name // "",
    (if .thinking.enabled then .effort.level // "" else "" end),
    (.context_window.used_percentage | pct),
    (.rate_limits.five_hour.used_percentage | pct),
    (.rate_limits.seven_day.used_percentage | pct),
    (.rate_limits.seven_day.resets_at | eta)
  ] | join("\u001f")')
branch=$(git -C "$dir" branch --show-current 2>/dev/null)

SEP=$(c 90 '|')
line=$(c 34 "[${dir##*/}]")
[ -n "$branch" ] && line+=$(c 35 "($branch)")
line+="$SEP$(c '1;33' "$model")"
[ -n "$effort" ] && line+=$(c 2 " $effort")

seg() { [ -n "$3" ] && line+="$SEP$(c "$1" "$2 $3%")"; }
seg 32 5h "$h5"
seg 32 W "$d7"
[ -n "$d7" ] && [ -n "$d7r" ] && line+=$(c 2 "  $d7r")
seg 36  "$ctx"

printf '%s' "$line"
