#!/bin/bash
##Modif gdna##
STRING="

 d888b  d8888b. d8b   db  .d8b.  
88' Y8b 88   8D 888o  88 d8   8b 
88      88   88 88V8o 88 88ooo88 
88  ooo 88   88 88 V8o88 88~~~88 
88. ~8~ 88  .8D 88  V888 88   88 
 Y888P  Y8888D' VP   V8P YP   YP 

         team gecko 
"
#echo $STRING
cat <<EOF >lol.txt
$STRING
EOF
cat lol.txt

cd /my_ca
chmod g+w .
. ./vars
./clean-all
echo "GDNA génére une clée Diffie Hellman"
./build-dh
echo "GDNA génére une clée master Certificate Authority"
./build-ca --batch
./build-key-server server --batch
read -p "Indiquer le noms de domaine du future server (ex: gdna.re)   " srv
read -p "Voulez-vous que GDNA place les fichier a leur place?(Y/N) un non créera une archive dans /etc/openvpn/    " yn
    case $yn in
        [Yy]* ) cp keys/dh*.pem keys/ca.crt keys/server.crt keys/server.key /opt/server.conf /etc/openvpn/;;
        [Nn]* ) mkdir /etc/openvpn/tgz; cp keys/dh*.pem keys/ca.crt keys/server.crt keys/server.key /opt/server.conf /etc/openvpn/tgz/;tar -zcvf /etc/openvpn/server.tar.gz /etc/openvpn/tgz/*; rm -rf /etc/openvpn/tgz ;;
        * ) echo "Please answer yes or no.";;
    esac
read -p "combien de client voulez vous crée pour cette configuration?   " cli
for (( c=1; c<=cli; c++ ))
do  
echo "Generating keys..."
    
    ./build-key client$c
mkdir /etc/openvpn/tgz
cp keys/ca.crt keys/client$c.crt keys/client$c.key /opt/client.conf /etc/openvpn/tgz/;
echo "remote $srv 1194" >> /etc/openvpn/tgz/client.conf;
echo "cert client$c.crt" >> /etc/openvpn/tgz/client.conf;
echo "key client$c.key" >> /etc/openvpn/tgz/client.conf;
tar -zcvf /etc/openvpn/client$c.tar.gz /etc/openvpn/tgz/* ;
rm -rf /etc/openvpn/tgz ;
done







