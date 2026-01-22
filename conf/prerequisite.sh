#!/bin/bash
#####################################################
# Source https://mailinabox.email/ https://github.com/mail-in-a-box/mailinabox
# Updated by cryptopool.builders for crypto use...
# Modified by SikkieNL
#####################################################

echo
echo
echo -e "$CYAN => Check prerequisite : $COL_RESET"
echo

# Detect Ubuntu version
UBUNTU_VERSION=$(lsb_release -rs 2>/dev/null || grep VERSION_ID /etc/os-release | cut -d'"' -f2)
UBUNTU_MAJOR=$(echo "$UBUNTU_VERSION" | cut -d. -f1)

# Ubuntu version validation
if [[ -z "$UBUNTU_VERSION" ]]; then
  echo
  echo -e "$RED ************************************************************************ $COL_RESET"
  echo -e "$RED Unable to detect Ubuntu version. $COL_RESET"
  echo -e "$RED ************************************************************************ $COL_RESET"
  echo
  exit 1
fi

if (( UBUNTU_MAJOR < 22 )); then
  echo
  echo -e "$RED ************************************************************************ $COL_RESET"
  echo -e "$RED Ubuntu $UBUNTU_VERSION is NOT supported. $COL_RESET"
  echo -e "$RED Please use Ubuntu 22.04 LTS or higher. $COL_RESET"
  echo -e "$RED ************************************************************************ $COL_RESET"
  echo
  exit 1
fi

echo
echo -e "$GREEN ************************************************************************ $COL_RESET"
echo -e "$GREEN Ubuntu version OK: $UBUNTU_VERSION $COL_RESET"
echo -e "$GREEN ************************************************************************ $COL_RESET"
echo

# Fix permissions (only if needed)
sudo chmod g-w /etc /etc/default /usr || true

# Architecture check
ARCHITECTURE=$(uname -m)
if [[ "$ARCHITECTURE" != "x86_64" && -z "$ARM" ]]; then
  echo
  echo -e "$RED ************************************************************************ $COL_RESET"
  echo -e "$RED YiimP Install Script only supports x86_64. $COL_RESET"
  echo -e "$RED And will not work on any other architecture, like ARM or 32 bit OS. $COL_RESET"
  echo -e "$RED Your architecture is $ARCHITECTURE $COL_RESET"
  echo -e "$RED ************************************************************************ $COL_RESET"
  echo
  exit 1
fi

echo
echo -e "$GREEN ************************************************************************ $COL_RESET"
echo -e "$GREEN Architecture OK: $ARCHITECTURE $COL_RESET"
echo -e "$GREEN ************************************************************************ $COL_RESET"
echo
