#!/bin/bash
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
OK="${GREEN}[OK]${NC}"
Error="${RED}[Mistake]${NC}"
BRED="\e[41m"
BBLUE="\e[38;5;21m"
# ==========================================
#information
OK = "$ {
  Green
}[OK]$ {
  Font
}"
Error = "$ {
  Red
}[Mistake]$ {
  Font
}"
clear
echo -e ""
echo -e "$BLUE  ╔═══════════════════════════════════════════════════════════════════════╗$NC"
echo -e "$BLUE  ║$NC $BRED                           XRAY-MultiPort                            $BLUE ║"
echo -e "$BLUE  ╚═══════════════════════════════════════════════════════════════════════╝$NC"
echo -e "$BLUE  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$BLUE  ║ $ORANGE     ✶ VMESS WS/GRPC ✶    $BLUE       ║  $ORANGE     ✶ TROJAN WS/GRPC ✶      $BLUE   ║"
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╠➣$NC 1. Create Account Vmess Tls  $BLUE    ╠➣$NC 7. Create Account Trojan WS   $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 2. Create Account Vmess NTls $BLUE    ╠➣$NC 8. Create Account Trojan Grpc $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 3. Create Account Vmess gRPC $BLUE    ╠➣$NC 9. Delete Account Trojan      $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 4. Delete Account Vmess      $BLUE    ╠➣$NC 10. Rennew Account Trojan     $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 5. Rennew Account Vmess      $BLUE    ╠➣$NC 11. Detail Account Trojan     $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC 6. Detail Account Vmess      $BLUE    ╠➣$NC                               $BLUE   ║ "
echo -e "$BLUE  ╠➣$NC                              $BLUE    ╠➣$NC                               $BLUE   ║ "
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"
echo -e "$BLUE  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$BLUE  ║$ORANGE         ✶ TROJAN WS ✶      $BLUE       ║$ORANGE     ✶ SHADOWSOCKS WS ✶            $BLUE║"
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╠➣$NC 7. Create Account XRAYS Trojan $BLUE  ╠➣$NC 10. Create Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ╠➣$NC 8. Delete Account XRAYS Trojan $BLUE  ╠➣$NC 11. Delete Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ╠➣$NC 9. Rennew Account XRAYS Trojan $BLUE  ╠➣$NC 12. Rennew Account ShadowSocks $BLUE  ║"
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"
echo -e "$BLUE  ╔═══════════════════════════════════╦═══════════════════════════════════╗"
echo -e "$BLUE  ║                                 $BLUE  ╠➣$NC 0. Back To Menu               $BLUE   ║ "
echo -e "$BLUE  ║-----------------------------------║-----------------------------------║"
echo -e "$BLUE  ╚═══════════════════════════════════╩═══════════════════════════════════╝$NC"

read -p " ➣ Select From Options [ 0 - 16 ]:  " menu
echo -e ""
case $menu in
1)
addvmess
;;
2)
dellvmess
;;
3)
rennewvmess
;;
4)
addvmessntls
;;
5)
dellvmessntls
;;
6)
rennewvmessntls
;;
7)
addtrojan
;;
8)
delltrojan
;;
9)
rennewtrojan
;;
10)
addss
;;
11)
dellss
;;
12)
rennewss
;;
13)
addtrojangrpc
;;
14)
addvmessgrpc
;;
15)
viewtrojan
;;
16)
viewvmess
;;
0)
menu
;;
*)
clear
bash menu
;;
esac
#
