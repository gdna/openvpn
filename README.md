![GDNA](https://netinfosecure.com:8443/home/christophe@gdna.re/public-www/logo.jpg)

welcome this is GDNA simple openvpn for docker.

1. Step 1 first git clone this repo
2. Step 2 you have to build the image :

```
docker build -t openvpn .
```

3. Step 3 Run the docker:

```
docker run -p 1194:1194 --cap-add NET_ADMIN --name gdnavpn -v /root/openvpndir:/etc/openvpn -dit openvpn
```

4. Step4 you must run GDNA script and follow the leader

```
docker exec -it gdnavpn ./my_ca/creS.sh
```

thats it!
you can find config/key/cert  for cli in openvpndir flowder.

https://www.gdna.re
