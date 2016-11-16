# Selenium 3 Firefox with VNC viewer
This is a Seleniumserver with a Firefox webbrowser, which you can watch via an integrated VNC viewer ([noVNC](https://github.com/kanaka/noVNC)).  
The Dockerimage is based on [selenium/standalone-firefox-debug](https://hub.docker.com/r/selenium/standalone-firefox-debug/).  

# Start the container  
Run the container with `docker run --name myselenium -d -p 80:80 -p 4444:4444 whiledo/selenium-firefox-webvnc`.  
You can access the seleniumservice via port 4444 (http).  
On port 80 (http) you'll find the noVNC VNC viewer, that lets you look inside the container and see the firefox in action.

# Define screen resolution  
To define the screen size pass the SCREEN_WIDTH	and SCREEN_HEIGHT environment variables to the run command.  
For example: `docker run --name myselenium -d -p 80:80 -p 4444:4444 -e SCREEN_WIDTH=1024 -e SCREEN_HEIGHT=768 whiledo/selenium-firefox-webvnc`  
Default screen size is SCREEN_WIDTH=1920 and SCREEN_HEIGHT=1080.

# Set timezone  
If you need a special timezone, create a Dockerfile like the following and replace Europe/Berlin with your Timezone.    
```bash
FROM whiledo/selenium-firefox-webvnc
 
ENV TZ="Europe/Berlin"

RUN ln -snf /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
 && echo "Europe/Berlin" > /etc/timezone \
 && dpkg-reconfigure -f noninteractive tzdata
```


