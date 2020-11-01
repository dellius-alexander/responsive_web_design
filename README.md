
[![LOGO](https://github.com/dellius-alexander/responsive_web_design/blob/master/docs/images/logo.png)](https://github.com/dellius-alexander/responsive_web_design)

# responsive_web_design

## Website Demo URL: 


[DEMO](https://dellius-alexander.github.io/responsive_web_design/)

<!-- Search box Begin -->


<div id="demo-box">
    <style>
        #demo_box {
            height:100px;
            width: 100%;
            line-height:100px;
        }    
        #container demo-iframe {
            vertical-align:middle;
            max-height:100%;
        }
    </style>
    <iframe id="demo-iframe" title="Hyfi Solutions" src="https://dellius-alexander.github.io/responsive_web_design/" width="80%" height="200" scrolling="no" sandbox>
    </iframe>
</div>
<!-- Search box End -->	



---
---

## Docker Build Command
---
---
|  **Description** |  **Command**  |
|:---	|:---	|
| Build from docker file | docker build -t www:v4 -f [www.Dockerfile](https://github.com/dellius-alexander/responsive_web_design/blob/master/www.Dockerfile) . |
| Build from current directory | docker build -t www:v4 -f *.Dockerfile . |
|  |  |
---

## Dockerfile
---
---
### Webserver build configuration
---

```bash

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
# RUN git clone https://github.com/user.name/repository_name.git 
# Move your updated files and recursively overwrite
# RUN mv -r /repository_name/*  /usr/share/nginx/html
#
#####################################################################
# Copy from current repo
#
# copy files to build image
COPY [ "./docs/", "/usr/share/nginx/html" ]
RUN ls -lia /usr/share/nginx/html
#
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