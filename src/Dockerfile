FROM ubuntu:14.04

MAINTAINER Peter Parente <parente@cs.unc.edu>

RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe" > /etc/apt/sources.list
RUN echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main universe" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get -y -q install wget
RUN apt-get -y -q install nodejs npm
RUN apt-get -y -q install nodejs-legacy

RUN wget https://github.com/hakimel/reveal.js/archive/2.6.2.tar.gz
RUN tar xzf 2.6.2.tar.gz
RUN mv /reveal.js-2.6.2 /revealjs

RUN mkdir -p /revealjs/md

WORKDIR /revealjs

RUN npm install -g grunt-cli
RUN npm install
RUN sed -i Gruntfile.js -e 's/port: port,/port: port, hostname: "",/'
ADD . /revealjs/
ONBUILD ADD . /revealjs/
#ADD custom.css /revealjs/css/
#ADD title.js /revealjs/plugin/
#CMD rm -rf /revealjs/markdown
#ONBUILD ADD markdown /revealjs/markdown

EXPOSE 8000
VOLUME ["/revealjs/markdown/"]
CMD ["grunt", "serve"]

