# CPOP
Consul + ProxySQL + Orchestrator + PMM


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
  + master.sh : 3306 port
  + slave1.sh : 3307 port
  + slave2.sh : 3308 port


5. ProxySQL Server : 3366 port
  + build.sh
  + run.sh
  + http://127.0.0.1:6080
  

6. Stress shell
  + run.sh


# scenario
+ 0.run -> 1.run -> 2.run -> 3.run -> 4.master -> 5.run -> 6.run -> 4.slave1 -> 5.slave2

# github
+ https://github.com/swapbyt3s/MySQLSandbox
+ https://github.com/wix-incubator/ocp

+ https://github.com/hashicorp/consul
+ https://github.com/github/orchestrator
+ https://github.com/percona/pmm-server
+ https://github.com/sysown/proxysql

# slide
+ https://www.percona.com/live/e17/sites/default/files/slides/Orchestrating%20ProxySQL%20with%20Orchestrator%20and%20Consul%20-%20FileId%20-%20115583.pdf
+ https://www.percona.com/live/18/sites/default/files/slides/Orchestrator%20High%20Availability%20Tutorial%20-%20FileId%20-%20137032.pdf
+ https://www.slideshare.net/LeeHyeongchae/ocp-with-super-tengen-toppa
