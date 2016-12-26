![GDNA](https://netinfosecure.com:8443/home/christophe@gdna.re/public-www/logo.jpg)

welcome this is GDNA simple openvpn for docker.

1.  first git clone this repo
2.  you have to build the image :
3.  Run the docker:
4.  you must run GDNA script and follow the leader

```
**docker build -t openvpn .**
```

```
**docker run -p 1194:1194 --cap-add NET_ADMIN --name gdnavpn -v /root/openvpndir:/etc/openvpn -dit openvpn**
```

```
**docker exec -it gdnavpn ./my_ca/creS.sh**
```

thats it!
you can find config/key/cert  for cli in openvpndir flowder.

https://www.gdna.re
