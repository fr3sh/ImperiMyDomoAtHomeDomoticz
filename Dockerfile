FROM arm32v7/debian
RUN apt-get update && apt-get -y  install wget nano sudo curl nodejs npm 
RUN wget -qO - https://www.e-nef.com/domoticz/mdah/gpg.mykey | apt-key add -
RUN echo "deb https://www.e-nef.com/domoticz/mdah/ /" | tee -a /etc/apt/sources.list.d/mycustom.list
RUN apt-get update
RUN useradd -ms /bin/bash fr3sh && echo "fr3sh:fr3sh" | chpasswd && adduser fr3sh sudo
RUN echo "fr3sh ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
#RUN usermod -aG sudo fr3sh
USER fr3sh
RUN sudo apt-get install MyDomoAtHome 

RUN sudo mv /etc/mydomoathome/config.json /etc/mydomoathome/config.json.old
VOLUME /etc/mydomoathome/

#sudo nano /etc/mydomoathome/config.json
EXPOSE 3002
RUN sudo service mydomoathome restart
CMD sudo service mydomoathome start && tail -F /dev/null
#ENTRYPOINT ["tail", "-f", "/dev/null"]

