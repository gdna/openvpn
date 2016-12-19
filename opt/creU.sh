#!/bin/bash
##Modif gdna##
STRING="

 d888b  d8888b. d8b   db  .d8b.  
88' Y8b 88   8D 888o  88 d8   8b 
88      88   88 88V8o 88 88ooo88 
88  ooo 88   88 88 V8o88 88~~~88 
88. ~8~ 88  .8D 88  V888 88   88 
 Y888P  Y8888D' VP   V8P YP   YP 



"
#print variable on a screen
#echo $STRING
cat <<EOF >lol.txt
$STRING
EOF
cat lol.txt
read -p "combien de client voulez vous crée pour cette configuration?" cli
for (( c=1; c<=cli; c++ ))
do  
    ./build-key client$c
done
