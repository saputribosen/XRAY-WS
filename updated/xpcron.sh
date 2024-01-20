#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
clear
# Path
59 23 * * * /usr/bin/xp
*/1 * * * * echo '' > /var/log/auth.log
*/1 * * * * echo '' > /var/log/daemon.log
59 */4 * * * /usr/bin/restart-xray
*/1 * * * * /usr/bin/akses
0 0 * * * /usr/bin/xpakses
