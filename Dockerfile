FROM ubuntu:xenial

# Fetching packages
RUN apt-get update && apt-get install -y \
	openssh-server \
	apache2 \
	supervisor \
	vim \
	iputils-ping \
	openjdk-8-jdk 

# SSH Configuration
#RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
#EXPOSE 22 80

# Hadoop Setup
ADD https://archive.apache.org/dist/hadoop/common/hadoop-2.10.0/hadoop-2.10.0.tar.gz /usr/local/
RUN tar -C /usr/local/ -xvf /usr/local/hadoop-2.10.0.tar.gz
RUN mv /usr/local/hadoop-2.10.0/ /usr/local/hadoop/
RUN rm /usr/local/hadoop-2.10.0.tar.gz
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_INSTALL=/usr/local/hadoop
ENV PATH=$PATH:$HADOOP_INSTALL/bin
ENV PATH=$PATH:$HADOOP_INSTALL/sbin
ENV HADOOP_MAPRED_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_HOME=$HADOOP_INSTALL
ENV HADOOP_HDFS_HOME=$HADOOP_INSTALL
ENV YARN_HOME=$HADOOP_INSTALL
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_INSTALL/lib/native
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_INSTALL/lib"

# Hadoop Configurations
COPY hadoop-configurations/* /usr/local/hadoop/etc/hadoop/

# Start SSH service
#CMD ["/usr/bin/supervisord"]
