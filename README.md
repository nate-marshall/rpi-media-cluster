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



{"value":"options:{value:remote}"}

["1_ChromaFlake_16_Diamond_1,1_ChromaFlake_16_Diamond_2,2_ChromaFlake_16_3_prong_2,2_ChromaFlake_16_3_prong_3,3_ChromaFlake_16_Arrow_2,3_ChromaFlake_16_Arrow_3,4_ChromaFlake_16_2_prong_2,4_ChromaFlake_16_2_prong_4,Boscoyo_ChromaCane_1,Boscoyo_ChromaCane_2,Boscoyo_ChromaCane_3,Boscoyo_ChromaCane_4,Boscoyo_ChromaCane_5,Boscoyo_ChromaFlake_12_2_prong,Boscoyo_ChromaFlake_12_3_prong,Boscoyo_ChromaFlake_12_Arrow,Boscoyo_ChromaFlake_12_Diamond,Boscoyo_ChromaGlow_Present_Lrg,Boscoyo_ChromaGlow_Present_Med,Boscoyo_ChromaGlow_Present_Sml,Boscoyo_ChromaOrnament_3_Round_with_Spinner,ChromaTree_Slender_4ft,ChromaTree_Slender_4ft-2,Driveway_right_ground,Flowerbed_border,Front_Door,GarageDoor1,GarageDoor1-2-Roof-2,GarageDoor2,GarageDoor3,GarageDoor3-Roof,Left_Driveway_Line,Office-Roof,OfficeWindowArchLeft,OfficeWindowArchRight,Ornament_1,Ornament_2,Ornament_3,Ornament_4,Front Porch", "Enabled", "WLED - Twinkleup", "Horizontal", "128", "128", "128", "Default", "#ff0000", "#00ff04", "#ffffff"],


{"colors":["#ff0000","#00ff00","#0000ff"],"brightness":128,"speed":128,"intensity":128,"bufferMapping":"Horizontal","palette":"Default","multisync":true,"models":["1_ChromaFlake_16_Diamond_1,1_ChromaFlake_16_Diamond_2,2_ChromaFlake_16_3_prong_2,2_ChromaFlake_16_3_prong_3,3_ChromaFlake_16_Arrow_2,3_ChromaFlake_16_Arrow_3,4_ChromaFlake_16_2_prong_2,4_ChromaFlake_16_2_prong_4,Boscoyo_ChromaCane_1,Boscoyo_ChromaCane_2,Boscoyo_ChromaCane_3,Boscoyo_ChromaCane_4,Boscoyo_ChromaCane_5,Boscoyo_ChromaFlake_12_2_prong,Boscoyo_ChromaFlake_12_3_prong,Boscoyo_ChromaFlake_12_Arrow,Boscoyo_ChromaFlake_12_Diamond,Boscoyo_ChromaGlow_Present_Lrg,Boscoyo_ChromaGlow_Present_Med,Boscoyo_ChromaGlow_Present_Sml,Boscoyo_ChromaOrnament_3_Round_with_Spinner,ChromaTree_Slender_4ft,ChromaTree_Slender_4ft-2,Driveway_right_ground,Flowerbed_border,Front_Door,GarageDoor1,GarageDoor1-2-Roof-2,GarageDoor2,GarageDoor3,GarageDoor3-Roof,Left_Driveway_Line,Office-Roof,OfficeWindowArchLeft,OfficeWindowArchRight,Ornament_1,Ornament_2,Ornament_3,Ornament_4,Front Porch"],"systems":["100.92.214.124"]}

