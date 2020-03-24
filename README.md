# ImperiMyDomoAtHomeDomoticz

Docker Container for conection Imperi Home and domoticz.

If you like you can install as your own on debian container. 
All command for manual instal is in debianInstal file 

docker-compose sample with volume mounted

version: "2"
services:
  mydomo:
    image: fr3sh12/imperi
    container_name: imperi
    environment:
      - DOMO=http://192.168.88.240:8080   # if no volume mounted
      - TZ=Europe/Warsaw
    volumes:
      - ./Imperi:/etc/mydomoathome/
    ports:
      - 3002:3002
    restart: unless-stopped


#####SAMPLE######################
#cinfig.json in ./Imperi katalog#
#################################
{
  "app_name": "MyDomoAtHome",
   "auth": null,
   "domoticz": {
        "ssl": false,
        "host": "192.168.88.240",
        "port": "8080",
        "path": "/domoticz/",
        "auth": null
   },
  "port": 3002,
  "passcode": ""
}
#########################################

