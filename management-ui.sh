#!/bin/bash
function startmc() {
  /usr/bin/screen -S minecraft -d -m bash -c "./start.sh"
}

function stopmc() {
  for session in $(screen -ls | grep -o '[0-9]*\.minecraft'); do screen -S "${session}" -X quit; done
}

function consolemc() {
  echo "Press Ctrl-D and Ctrl-A to exit out of the console" && sleep 3 && screen -r minecraft
}

while true
do
menuitem=$(dialog --menu "MineFra.me Server Menu\nVersion: 1.0-release\n$(cat motd)" 20 60 10 "Start" "Start your Minecraft server" "Stop" "Stop your Minecraft server" "Console" "Enter Console" "Exit" "Exit the control panel" --output-fd 1);

case $menuitem in
        Start) startmc;;
        Stop) stopmc;;
        Console) consolemc;;
        Exit) exit; break;;
esac
done