#Download base image
FROM alpine:latest

LABEL description="This is custom Docker Image for Ansible Docker"

RUN apk update && apk add ansible git openssh-client tmux

#RUN mkdir -p /etc/ansible/backups/labs

WORKDIR /etc/ansible

ADD .ssh/* /root/.ssh/
RUN mv /root/.ssh/ansible-gns3_rsa /root/.ssh/id_rsa

RUN git config --global user.email "nepryahin.1989@gmail.com"
RUN git config --global user.name "ivan-1989"


RUN git clone https://github.com/ivan-1989/labs.git /etc/ansible/

RUN git remote set-url origin  git@github.com:ivan-1989/labs.git

#RUN git clone git@github.com:ivan-1989/labs.git /etc/ansible/

#RUN git clone https://github.com/ivan-1989/ansible.git /etc/ansible



#VOLUME /etc/ansible/backups/labs

#RUN mkdir -p /root/.ssh
#RUN cp -R /etc/ansible/backups/labs/ansible-configs/id_rsa-nepryahin.lab /root/.ssh/id_rsa
#COPY  *_rsa /root/.ssh

#RUN touch /root/.ssh/config
#RUN echo "Host *" > /root/.ssh/config
#RUN echo "    StrictHostKeyChecking no" >> /root/.ssh/config
#RUN chmod -R 600 /root/.ssh
#ENTRYPOINT  ping ya.ru

