# escape=\
#
FROM  nginx:1.19.3
RUN apt-get update && apt-get -y upgrade \
&& apt-get install -y git
RUN uname -a
RUN echo "Successfully updated and upgrade"
#####################################################################
# Download from Repo...(git)
#
# RUN git clone https://github.com/dellius-alexander/responsive_web_design.git
# RUN cp -r responsive_web_design/docs/*   /usr/share/nginx/html
# # Clean up our image
# RUN rm -rf responsive_web_design
#
#####################################################################
# Copy from current repo
#
# copy files to build image
COPY [ "${PWD}/docs/", "/usr/share/nginx/html" ]
RUN sleep 2
RUN ls -lia /usr/share/nginx/html
RUN sleep 2
#
RUN echo "Project Successfully copied to working directory..."
RUN sleep 2
#
# Expose HTTP PORT
EXPOSE 80
RUN echo "Expose Port 80 inside container"
#
# working directory
WORKDIR /usr/share/nginx/html
CMD [ "nginx", "-g", "daemon off;" ]