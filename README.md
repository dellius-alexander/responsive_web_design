# responsive_web_design

## Website Demo URL: 
https://dellius-alexander.github.io/responsive_web_design/

---
---

## Docker Build Command
---
---
| **Description** | **Command**|
|:---	|:---	|
| Build from docker file | docker build -t www:v4 -f www.Dockerfile . |
| Build from current directory | docker build -t www:v4 -f *.Dockerfile . |
|  |  |
---

## Dockerfile
---
---
### Webserver build configuration
---

```bash [![Dockerfile](www.Dockerfile)*www.Dockerfile*][https://github.com/dellius-alexander/responsive_web_design/blob/master/dockerfile]

# escape=\ (backslash)
#
FROM  nginx:1.19.3
RUN apt update && apt-get -y upgrade \
&& apt install -y git
RUN uname -a
RUN echo "Successfully updated and upgrade"

#####################################################################
# Download from Repo...(git)
#
RUN git clone https://github.com/dellius-alexander/responsive_web_design.git 
RUN mv -r /responsive_web_design/*  /usr/share/nginx/html
#
# copy files to build image
# COPY [ "./docs/", "/usr/share/nginx/html" ]
#
RUN ls -lia /usr/share/nginx/html
RUN echo "Project Successfully copied to working directory..."
RUN sleep 2
#
# Expose HTTP PORT
EXPOSE 80
#
# working directory
WORKDIR /usr/share/nginx/html
CMD [ "nginx", "-g", "daemon off;" ]


```
---



<!-- blank line -->
<figure class="img">
			<script src="scripts/jquery-3.3.1.min.js"></script> 
			<script src="scripts/jquery.backstretch.js"></script> 
  <iframe src="https://github.com/dellius-alexander/responsive_web_design/blob/master/docs/images/logo.png" frameborder="0" allowfullscreen="false"> </iframe>
		<!-- JS -->
		<script src="scripts/jquery-3.3.1.min.js"></script> 
		<script src="scripts/jquery.fancybox.min.js"></script>	
</figure>
<!-- blank line -->


.... <!-- post content -->

<div class="iframe_container">
  <iframe width="560" height="315" src="https://github.com/dellius-alexander/responsive_web_design/blob/master/docs/images/logo.png" frameborder="0" allowfullscreen></iframe>
</div>

.... <!-- post content -->