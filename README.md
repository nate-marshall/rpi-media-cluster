# rpi-media-cluster

A bunch of yamls to run my media server apps on a Lightweight Kubernetes cluster ([k3s](https://k3s.io/)) with [RaspberryPi hardware](https://www.raspberrypi.org/products/raspberry-pi-4-model-b/) (one RPi4 2GB master and three RPi4 4GB nodes)

## Components
- MetalLB
- Nginx with cert-manager
- Heimdall
- Sabnzbd
- Hydra2
- Sonarr
- CouchPotato
- Grocy  

----

- Plex (WIP)
- Monitoring (WIP)
- HomeAssistant (WIP)
- VPN Server (WIP)
  
---
 
### Notes
- NFS server config: Not noted in this repo. [There are many ways that you can build out a NFS server on your network](https://lmgtfy.com/?q=How+do+I+build+a+nfs+server).
- Plex: Starts up and runs fine, but the RPi hardware didn't keep up with any media that needed to be transcoded. 


