FROM ubuntu:bionic
RUN apt update
RUN apt install -y ca-certificates curl bash openssl xz-utils wget
RUN wget https://github.com/trojan-gfw/trojan/releases/download/v1.16.0/trojan-1.16.0-linux-amd64.tar.xz -O trojan.tar.xz
RUN mkdir /trojan
RUN tar -xf trojan.tar.xz -C /trojan
ADD /trojan/config.json /trojan/config.json
RUN chmod +x /trojan/config.json

ADD /trojan/certificate.crt /trojan/certificate.crt
RUN chmod +x /trojan/certificate.crt

ADD /trojan/private.key /trojan/private.key
RUN chmod +x /trojan/private.key
RUN chmod +x /trojan/trojan

ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
RUN chgrp -R 0 /trojan
RUN chmod -R g+rwX /trojan
CMD /configure.sh
