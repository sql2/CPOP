# CPOP
Conul + ProxySQL + Orchestrator + PMM

0. Create network
 + Data Center : Marvel_DC
 + create_net.sh

1. Consul server
  + build.sh
  + run.sh
  + http://127.0.0.1:8500

2. Orchestrator server
  + build.sh
  + run.sh
  + http://127.0.0.1:3000

3. PMM Server
  + run.sh
  + http://127.0.0.1:80

4. MySQL Server
  + build.sh
  + master.sh
  + slave1.sh
  + slave2.sh

5. ProxySQL Server
  + build.sh
  + run.sh
  + http://127.0.0.1:6080

6. Stress shell
  + run.sh

scenario
+ 0.run -> 1.run -> 2.run -> 3.run -> 4.master -> 5.run -> 6.run -> 4.slave1 -> 5.slave2
