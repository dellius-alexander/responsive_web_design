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
COPY [ "./docs/", "/usr/share/nginx/html" ]
#
RUN ls -lia "/usr/share/nginx/html"
RUN printf "\n\n"
RUN sleep 2
#
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