
[![LOGO](https://github.com/dellius-alexander/responsive_web_design/blob/master/docs/images/logo.png)](https://github.com/dellius-alexander/responsive_web_design)

# responsive_web_design

## Website Demo URL

<!-- Demo Box -->

[![](docs/images/homepage.png)](https://dellius-alexander.github.io/responsive_web_design/)

<!-- Demo Box -->

---
---

## Docker Build Command
---
|  **Description** |  **Command**  |
|:---	|:---	|
| Build from docker file | docker build -t www:v4 -f [www.Dockerfile](https://github.com/dellius-alexander/responsive_web_design/blob/master/www.Dockerfile) . |
|  |  |
---

## Dockerfile
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
# Copy your repo files and recursively overwrite target directory
# RUN cp -r repository_name/docs/*   /usr/share/nginx/html
# # Clean up our image
# RUN rm -rf repository_name
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