FROM ubuntu:22.04

RUN apt update -y && apt upgrade -y

RUN apt install libfl-dev zlib1g-dev curl -y

RUN curl -LJ -o /opt/graalvm.tar.gz https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-21.0.2/graalvm-community-jdk-21.0.2_linux-x64_bin.tar.gz

RUN tar -xzf /opt/graalvm.tar.gz -C /opt/
RUN rm -rf /opt/graalvm.tar.gz

RUN curl -LJ -o /opt/apache-maven.tar.gz https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz

RUN tar -xzf /opt/apache-maven.tar.gz -C /opt/
RUN rm -rf /opt/apache-maven.tar.gz

ENV JAVA_HOME /opt/graalvm-community-openjdk-21.0.2+13.1
ENV M2_HOME /opt/apache-maven-3.9.6
ENV PATH="$PATH:$JAVA_HOME/bin:$M2_HOME/bin"
