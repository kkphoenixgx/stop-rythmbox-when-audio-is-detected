#!/bin/bash

paused=false

while true; do
  inputs=$(pactl list sink-inputs)

  # Lista todos os streams ativos (Corked: no)
  active_streams=$(echo "$inputs" | awk '
    BEGIN { RS="Sink Input #" }
    /Corked: no/ { print $0 }
  ')

  # Verifica se o Rhythmbox está entre eles
  rhythmbox_playing=$(echo "$active_streams" | grep -i "application.name = \"Rhythmbox\"")

  # Conta quantos streams ativos existem
  count_active=$(echo "$active_streams" | grep -c "application.name = ")

  # Remove o Rhythmbox da contagem (se estiver)
  other_active=$count_active
  if [[ -n "$rhythmbox_playing" ]]; then
    other_active=$((count_active - 1))
  fi

  if [[ $other_active -gt 0 ]]; then
    if ! $paused; then
      playerctl --player=rhythmbox pause
      paused=true
    fi
  else
    if $paused; then
      playerctl --player=rhythmbox play
      paused=false
    fi
  fi

  sleep 1
done
