#!/bin/bash

# Ziel-Server, zu dem der Reverse SSH-Tunnel hergestellt werden soll
ziel_server="94.16.104.19"
ziel_benutzer="oval"
ziel_port="22"  # Standard SSH-Port

# Port-Weiterleitungen: Format: lokaler_port:ziel_ip:ziel_port
port_weiterleitungen=(
    "4000:localhost:4000"
    "5000:localhost:5000"
    "8030:localhost:8030"
    "9000:localhost:9000"
    "8545:localhost:8545"
)

# SSH-Befehl für den Reverse SSH-Tunnel
ssh_befehl="autossh -M 0 -N -o 'ServerAliveInterval 30' -o 'ServerAliveCountMax 3' -R ${port_weiterleitungen[@]} -i /home/perpetuum/.ssh/id_rsa ${ziel_benutzer}@${ziel_server} -p ${ziel_port}"

# Tunnel aufbauen
echo "Starte Reverse SSH-Tunnel zu $ziel_server..."
echo "Port-Weiterleitungen:"
for weiterleitung in "${port_weiterleitungen[@]}"; do
    echo "  - $weiterleitung"
done
echo "Verbindung wird hergestellt..."
$ssh_befehl

# Überprüfen, ob der Tunnel erfolgreich aufgebaut wurde
if [ $? -eq 0 ]; then
    echo "Reverse SSH-Tunnel erfolgreich aufgebaut."
else
    echo "Fehler beim Aufbau des Reverse SSH-Tunnels."
fi

