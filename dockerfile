# escape=\ (backslash)
#
FROM nginx:stable
RUN apt-get update && apt-get -y upgrade \
&& apt-get install -y git
RUN echo "Successfully updated and upgrade"

# git clone https://github.com/dellius-alexander/responsive_web_design.git | \
# mv -r /responsive_web_design/*  /usr/share/nginx/html
#
# copy files to build image
COPY [ ".", "/usr/share/nginx/html" ]
RUN ls -lia /usr/share/nginx/html
RUN echo "Project Successfully copied to working directory..."
RUN sleep 2
#
# Expose HTTP PORT
EXPOSE 80

# working directory
WORKDIR /usr/share/nginx/html
CMD [ "nginx", "-g", "daemon off;" ]