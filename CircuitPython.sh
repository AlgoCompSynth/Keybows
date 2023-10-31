#! /bin/bash

set -e

source set_pico_envars

echo "Downloading CircuitPython release $CIRCUITPYTHON_VERSION"
curl -sOL \
  "https://downloads.circuitpython.org/bin/raspberry_pi_pico/en_US/adafruit-circuitpython-raspberry_pi_pico-en_US-$CIRCUITPYTHON_VERSION.uf2"

echo "Downloading flash_nuke.uf2"
# https://www.raspberrypi.com/documentation/microcontrollers/raspberry-pi-pico.html#resetting-flash-memory
curl -sOL https://datasheets.raspberrypi.com/soft/flash_nuke.uf2

echo "Installing 'python3-venv' if needed"
sudo apt-get install -qqy --no-install-recommends python3-venv

echo "Creating fresh 'Keybows' virtual environment"
python3 -m venv Keybows --clear
source ./Keybows/bin/activate
echo "Installing DotStar library"
pip3 install adafruit-circuitpython-dotstar

echo "Finished!"
