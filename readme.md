Documentation
- [UMTS-Stick](docs/UMTS-Stick.md)
- [VPN](docs/VPN.md)
- [MQTT](docs/MQTT.md)
- [Dienst zum Überwachen des Datenverbrauchs](Datenverbrauch.md)
- [Dienst zum Empfang von SMS](SMS-Empfang.md)

communication overview
```
           +----------------+    +----------------+    +----------------------+
           | Openhab-Client | -> | Openhab-Server | -> | MQTT-Server (Master) |
           +----------------+    +----------------+    +----------------------+
                                                                  ^
                                                                  |
+-----------+    +------+    +----------+    +-----+    +---------------------+
| VPN-Client| -> | UMTS | -> | Internet | -> | DSL | -> | Fritzbox-VPN-Server |
+-----------+    +------+    +----------+    +-----+    +---------------------+
      ^
      |
+----------------------+    +-------------+    +-------------+
| MQTT-Server (Bridge) | <- | MQTT-Client | <- | IoT-Devices |
+----------------------+    +-------------+    +-------------+
```
