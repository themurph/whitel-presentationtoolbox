FROM fedora

MAINTAINER "langdon" <langdon@fedoraproject.org>

RUN yum -y update; yum clean all
RUN yum -y install nodejs nodejs-grunt npm; yum clean all
RUN yum -y install nodejs-grunt-cli
#RUN echo "Apache" >> /var/www/html/index.html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
#ADD run-apache.sh /run-apache.sh
#RUN echo currentsMillies
#RUN chmod -v +x /run-apache.sh

#CMD ["/run-apache.sh"]
