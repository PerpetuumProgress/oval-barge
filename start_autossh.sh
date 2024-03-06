#!/bin/bash

# Ziel-Server, zu dem der Reverse SSH-Tunnel hergestellt werden soll
ziel_server="oval.pepro.io"
ziel_benutzer="oval"

# Port-Weiterleitungen
port_weiterleitungen=(
    "oval.pepro.io:4000:localhost:4000"
    "oval.pepro.io:5000:localhost:5000"
    "oval.pepro.io:8030:localhost:8030"
    "oval.pepro.io:9000:localhost:9000"
    "oval.pepro.io:8545:localhost:8545"
)

# Konvertiere das Array der Portweiterleitungen in ein String
port_weiterleitungen_string=""
for weiterleitung in "${port_weiterleitungen[@]}"; do
    port_weiterleitungen_string+=" -R $weiterleitung"
done

# SSH-Befehl für den Reverse SSH-Tunnel mit Portweiterleitungen
ssh_befehl="autossh -f -T -M 9999 -N -o ServerAliveInterval=30 -o ServerAliveCountMax=3 $port_weiterleitungen_string -i /home/perpetuum/.ssh/id_rsa ${ziel_benutzer}@${ziel_server}"


# Tunnel aufbauen
echo "Starte Reverse SSH-Tunnel zu $ziel_server..."
echo "Port-Weiterleitungen:"
for weiterleitung in "${port_weiterleitungen[@]}"; do
    echo "  - $weiterleitung"
done
echo "Verbindung wird hergestellt..."
$ssh_befehl