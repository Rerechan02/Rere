#!/bin/bash
clear
Login=rere-`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
clear
load
echo Create Akun: $Login
sleep 0.1
echo Setting Password: $Pass
sleep 0.1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
clear
echo -e "══════════════════════════"                 
echo -e "    <=  SSH ACCOUNT =>"       
echo -e "══════════════════════════"                 
echo -e ""
echo -e "Username     : $Login"
echo -e "Password     : $Pass"        
echo -e "CITY         : $(cat /root/.mycity)"
echo -e "ISP          : $(cat /root/.myisp)"
echo -e "Host/IP      : $(cat /etc/xray/domain)"
echo -e "NSDOMAIN     : $(cat /etc/xray/dns)"
echo -e "PUBKEY       : $(cat /etc/slowdns/server.pub)"
echo -e "Slowdns      : 443, 80, 53, 5300"
echo -e "Udp Custom   : 1-65535"
echo -e "Port ssl/tls : 441, 442, 443, 444, 2096"
echo -e "Port non tls : 80, 8000, 8080, 109, 69, 143"                        
echo -e "BadVpn       : 7200, 7300"      
echo -e ""  
echo -e "══════════════════════════"                 
echo -e "Payload Ws   => GET wss://bug.com/ HTTP/1.1[crlf]Host: $(cat /etc/xray/domain)[crlf]Upgrade: websocket[crlf][crlf]"
echo -e "══════════════════════════"                 
echo -e "     Expired => $exp"
echo -e "══════════════════════════"                 
echo -e ""
read -n 1 -s -r -p "Press any key to back on menu"
menu