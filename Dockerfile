FROM ubuntu
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update -y 
RUN apt-get install -y openvpn easy-rsa wget --fix-missing
RUN make-cadir my_ca
RUN cd /my_ca
RUN ls
RUN cd /my_ca && rm vars
COPY opt/* /my_ca/
COPY vars /my_ca
RUN chmod +x /my_ca/creS.sh
RUN chmod +x /my_ca/creU.sh
