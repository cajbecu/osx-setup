#!/usr/bin/env bash

# Read Claude Code's session data from stdin
input=$(cat)

echo "$input" > ~/.claude/status.log

# Extract values via jq
model=$(echo "$input"        | jq -r '.model.display_name // "Claude"')
effort=$(echo "$input"       | jq -r '.effort.level // ""')
thinking_enabled=$(echo "$input" | jq -r '.thinking.enabled // false')
if [ "$thinking_enabled" = "true" ]; then
    thinking="\e[32mthinking\e[0m"
else
    thinking="\e[90mthinking\e[0m"
fi
cost=$(echo "$input"         | jq -r '.cost.total_cost_usd // 0')
context_pct=$(echo "$input"  | jq -r '.context_window.used_percentage // 0')
five_hour_pct=$(echo "$input"   | jq -r '.rate_limits.five_hour.used_percentage // 0')
five_hour_reset=$(echo "$input" | jq -r '.rate_limits.five_hour.resets_at // 0')
seven_day_pct=$(echo "$input"   | jq -r '.rate_limits.seven_day.used_percentage // 0')
seven_day_reset=$(echo "$input" | jq -r '.rate_limits.seven_day.resets_at // 0')
cwd=$(echo "$input"             | jq -r '.cwd // ""')

# Compute reset clock + remaining time
now=$(date +%s)

if [ "$five_hour_reset" -gt 0 ]; then
    five_hour_clock=$(date -r "$five_hour_reset" "+%H:%M")
    rem=$((five_hour_reset - now))
    [ $rem -lt 0 ] && rem=0
    five_hour_left=$(printf "%dh%dm" $((rem / 3600)) $(((rem % 3600) / 60)))
else
    five_hour_clock="--:--"
    five_hour_left="0m"
fi

if [ "$seven_day_reset" -gt 0 ]; then
    rem=$((seven_day_reset - now))
    [ $rem -lt 0 ] && rem=0
    seven_day_left=$(printf "%dz %dh" $((rem / 86400)) $(((rem % 86400) / 3600)))
else
    seven_day_left="0z 0h"
fi

# Collapse cwd to tilde-relative path
home="/Users/cajbecu"
if [ "$cwd" = "$home" ]; then
    display_dir="~"
elif [ "${cwd#"$home/"}" != "$cwd" ]; then
    display_dir="~/${cwd#"$home/"}"
else
    display_dir="$cwd"
fi

# Get Git Branch
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch="📁 $display_dir 🌿 $(git -C "$cwd" branch --show-current)"
else
    branch="📁 $display_dir"
fi

# Color-code context percentage
if [ "$context_pct" -gt 80 ]; then
    color="\e[31m" # Red
elif [ "$context_pct" -gt 50 ]; then
    color="\e[33m" # Yellow
else
    color="\e[32m" # Green
fi

# Output the Statusline (Format: Model | Effort | Branch | Cost | Context | Rate Limits)
printf "🤖 %s | 🧠 %s | ✨ %b | %s | 💰 \$%.2f | 🪙 %b%d%%%b | ⏰ 5h:%d%% →%s (%s) · 📅 7d:%d%% (%s)\n" \
    "$model" "$effort" "$thinking" "$branch" "$cost" "$color" "$context_pct" "\e[0m" \
    "$five_hour_pct" "$five_hour_clock" "$five_hour_left" \
    "$seven_day_pct" "$seven_day_left"
