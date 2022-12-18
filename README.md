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




{
      "name": "temps",
      "description": "Populate the temp sensor",
      "topics": [
        {
          "topic": "@bind=vars.hassTopic;/sensor/@bind=vars.mqttTopic;/@bind=vars.mqttTopic;-1-airsensor/config",
          "useRootTopic": false,
          "processor": [
            "let device_id = {",
            " name : 'Pool Controller - njsPC',",
            " ids: [`${ctx.vars.mqttTopic}`],",
            " suggested_area : 'Pool'};",
            "return JSON.stringify({ name: `Air temp`,",
            "unique_id: `poolController-1-airsensor`,",
            "availability_topic: `${ctx.vars.mqttTopic}/state/status`,",
            "availability_template: \"{{'online' if value_json.name == 'ready' else 'offline'}}\",",
            "device: device_id,",
            "device_class: 'temperature',",
            "state_class: 'measurement',",
            "state_topic: `${ctx.vars.mqttTopic}/state/temps/air`,",
            "unit_of_measurement: `°${state.temps.data.units.name}`,",
            "value_template: '{{value_json.temp}}'});"
          ]
        }
      ]
    }