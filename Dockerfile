FROM selenium/standalone-firefox-debug:3.0.1-aluminum

RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y git
RUN cd /usr/share/nginx/html \
&& git clone https://github.com/kanaka/noVNC.git

RUN sed -i "s|WebUtil.getConfigVar('password', '');|'secret';|g" /usr/share/nginx/html/noVNC/vnc_auto.html
ADD nginx.conf /etc/nginx/conf.d/default.conf

ENV	SCREEN_WIDTH=1920 \
	  SCREEN_HEIGHT=1080

EXPOSE 80

CMD service nginx start && /opt/bin/entry_point.sh
