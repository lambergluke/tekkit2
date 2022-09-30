FROM openjdk:8-jre-slim-buster

RUN apt-get update \
	&& apt-get install -y curl unzip\
	&& mkdir /minecraft \
	&& cd /minecraft \
	&& curl https://servers.technicpack.net/Technic/servers/tekkit-2/Tekkit-2_Server_v1.0.5.zip -o tekkit_server.zip \
	&& unzip tekkit_server.zip \
	&& rm tekkit_server.zip \
	&& chmod +x LaunchServer.sh \
    && echo eula=true > eula.txt

EXPOSE 25565 25565/udp

WORKDIR /minecraft
CMD ["./LaunchServer.sh"]

