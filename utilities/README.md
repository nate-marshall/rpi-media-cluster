# FPP

Red with white lightning
```
curl 'http://192.168.1.101/api/command' \
-X POST \
-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0' \
-H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' \
-H 'Accept-Encoding: gzip, deflate' \
-H 'Content-Type: application/json' \
-H 'X-Requested-With: XMLHttpRequest' \
-H 'Origin: http://192.168.1.101' \
-H 'Connection: keep-alive' \
-H 'Referer: http://192.168.1.101/plugin.php?_menu=status&plugin=fpp-WledEffects&page=wledeffects.php' \
--data-raw '{
"command":"Overlay Model Effect",
"multisyncCommand":true,
"multisyncHosts":"192.168.1.101",
"args":["1_ChromaFlake_16_Diamond_1,1_ChromaFlake_16_Diamond_2,2_ChromaFlake_16_3_prong_2,2_ChromaFlake_16_3_prong_3,3_ChromaFlake_16_Arrow_2,3_ChromaFlake_16_Arrow_3,4_ChromaFlake_16_2_prong_2,4_ChromaFlake_16_2_prong_4,Boscoyo_ChromaCane_1,Boscoyo_ChromaCane_2,Boscoyo_ChromaCane_3,Boscoyo_ChromaCane_4,Boscoyo_ChromaCane_5,Boscoyo_ChromaFlake_12_2_prong,Boscoyo_ChromaFlake_12_3_prong,Boscoyo_ChromaFlake_12_Arrow,Boscoyo_ChromaFlake_12_Diamond,Boscoyo_ChromaGlow_Present_Lrg,Boscoyo_ChromaGlow_Present_Med,Boscoyo_ChromaGlow_Present_Sml,Boscoyo_ChromaOrnament_3_Round_with_Spinner,ChromaTree_Slender_4ft,ChromaTree_Slender_4ft-2,Driveway_right_ground,Flowerbed_border,Front_Door,GarageDoor1,GarageDoor1-2-Roof-2,GarageDoor2,GarageDoor3,GarageDoor3-Roof,Left_Driveway_Line,Office-Roof,OfficeWindowArchLeft,OfficeWindowArchRight,Ornament_1,Ornament_2,Ornament_3,Ornament_4","Enabled","WLED - Lightning","Horizontal","106","154","222","false","Default","#ffffff","#ff0000"]
}'
```

red/orange/black twinklefox
```
curl 'http://192.168.1.101/api/command' -X POST -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate' -H 'Content-Type: application/json' -H 'X-Requested-With: XMLHttpRequest' -H 'Origin: http://192.168.1.101' -H 'Connection: keep-alive' -H 'Referer: http://192.168.1.101/plugin.php?_menu=status&plugin=fpp-WledEffects&page=wledeffects.php' --data-raw '{"command":"Overlay Model Effect","multisyncCommand":true,"multisyncHosts":"192.168.1.101","args":["1_ChromaFlake_16_Diamond_1,1_ChromaFlake_16_Diamond_2,2_ChromaFlake_16_3_prong_2,2_ChromaFlake_16_3_prong_3,3_ChromaFlake_16_Arrow_2,3_ChromaFlake_16_Arrow_3,4_ChromaFlake_16_2_prong_2,4_ChromaFlake_16_2_prong_4,Boscoyo_ChromaCane_1,Boscoyo_ChromaCane_2,Boscoyo_ChromaCane_3,Boscoyo_ChromaCane_4,Boscoyo_ChromaCane_5,Boscoyo_ChromaFlake_12_2_prong,Boscoyo_ChromaFlake_12_3_prong,Boscoyo_ChromaFlake_12_Arrow,Boscoyo_ChromaFlake_12_Diamond,Boscoyo_ChromaGlow_Present_Lrg,Boscoyo_ChromaGlow_Present_Med,Boscoyo_ChromaGlow_Present_Sml,Boscoyo_ChromaOrnament_3_Round_with_Spinner,ChromaTree_Slender_4ft,ChromaTree_Slender_4ft-2,Driveway_right_ground,Flowerbed_border,Front_Door,GarageDoor1,GarageDoor1-2-Roof-2,GarageDoor2,GarageDoor3,GarageDoor3-Roof,Left_Driveway_Line,Office-Roof,OfficeWindowArchLeft,OfficeWindowArchRight,Ornament_1,Ornament_2,Ornament_3,Ornament_4","Enabled","WLED - Twinklefox","Horizontal","128","128","128","Default","#ff0000","#ff8040","#000000"]}'
```

Stop all effects
```
curl 'http://192.168.1.101/api/command' -X POST -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/118.0' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: gzip, deflate' -H 'Content-Type: application/json' -H 'X-Requested-With: XMLHttpRequest' -H 'Origin: http://192.168.1.101' -H 'Connection: keep-alive' -H 'Referer: http://192.168.1.101/plugin.php?_menu=status&plugin=fpp-WledEffects&page=wledeffects.php' --data-raw '{"command":"Overlay Model Effect","multisyncCommand":true,"multisyncHosts":"192.168.1.101","args":["Flowerbed_border","Enabled","Stop Effects"]}'
```