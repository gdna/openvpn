welcome this is GDNA simple openvpn for docker.
1.first git clone this repo
2. you have to build the image :

docker build -t openvpn .

3. Run the docker:

docker run -p 1194:1194 -v /root/dockervpn/openvpndir:/etc/openvpn -dit openvpn

4. you must run GDNA script and follow the leader

docker exec -it gdnavpn ./my_ca/creS.sh

thats it!
you can find config/key/cert  for cli in openvpndir flowder.

