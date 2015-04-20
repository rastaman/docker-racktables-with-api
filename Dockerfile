# Install https://github.com/RackTables/racktables.git
# with https://github.com/xing/racktables_api.git
FROM centos:centos7

# EPEL
RUN yum install -y epel-release
# MySQL: 
RUN yum install -y mysql-server mysql mysql-devel
# Apache/PHP: 
RUN yum install -y httpd php php-mysql php-pdo php-gd php-snmp php-mbstring php-bcmath
# To enable Unicode, add "character-set-server=utf8" line to "[mysqld]" section of "/etc/my.cnf" file and restart mysqld.
#RUN 
# Install dev tools
RUN yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
# Install ruby
RUN yum install -y ruby ruby-rdoc ruby-devel rubygems
RUN gem update
RUN gem update --system
# Clone racktables
ENV HOME /root
RUN git clone https://github.com/RackTables/racktables.git $HOME/racktables
# Let's continue this tomorrow