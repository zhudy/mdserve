sudo docker stop mdserve_golang
sudo docker stop mdserve_golang
sudo docker rm mdserve
sudo docker rm mdserve
#sudo docker run -itd -p 1234:8080 -v $PWD:/usr/share/mdserve --name mdserve mdserve:1.4
sudo docker run -it -p 8888:8080 -v $PWD:/usr/share/mdserve --name mdserve mdserve:1.4
//sudo systemctl restart docker //如果上面报错iptable啥的，是因为oci重启机器后自动启动docker，而防火墙重新配置后需要重新启动docker
OCI具体问题：
装完http-server后启动，发现外网访问不了，添加8080端口到DefaultSecurityList_for_vcnxxx也不行，经过与在线客服咨询，得到答案：
https://stackoverflow.com/questions/54794217/opening-port-80-on-oracle-cloud-infrastructure-compute-node
这样在Ubuntu中操作后就可以访问了：
$ sudo iptables -L
Then I saved the rules to a file so I could add the relevant ones back later:
$ sudo iptables-save > ~/iptables-rules
Then I ran these rules to effectively disable iptables by allowing all traffic through:
$ iptables -P INPUT ACCEPT
$ iptables -P OUTPUT ACCEPT
$ iptables -P FORWARD ACCEPT
$ iptables -F

