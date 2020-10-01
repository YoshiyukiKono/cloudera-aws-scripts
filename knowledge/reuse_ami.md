https://www.quora.com/How-do-I-change-the-IP-of-existing-cloudera-manager-without-disturbing-the-rest-of-nodes

```
Follow these steps:

Shutdown all services
On all nodes, “service cloudera-scm-agent stop”
On the CM server, “service cloudera-scm-server stop”.
Edit the config.ini to point to the new scm server
ip sudo nano /etc/cloudera-scm-agent/config.ini 
Change Host IP sudo nano /etc/hosts 
Restart the service on all node service cloudera-scm-agent restart 
Restart the service on master node service cloudera-scm-server restart
```

```
$ cat /etc/hosts
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

10.0.0.78  ip-10-0-0-78.us-east-2.compute.internal
10.0.0.78  ip-10-0-0-78.us-east-2.compute.internal
10.0.0.78  ip-10-0-0-78.us-east-2.compute.internal
[centos@ip-10-0-0-186 ~]$ ls -l /etc/hosts
```


```
sudo mv /etc/hosts /etc/hosts.org
sudo cp /etc/hosts.template /etc/hosts
sudo sh -c "echo '10.0.0.186  ip-10-0-0-186.us-east-2.compute.internal' >> /etc/hosts"
sudo sh -c "echo '`hostname -I`  `hostname`' >> /etc/hosts"
```

```
sudo mv /etc/cloudera-scm-agent/config.ini /etc/cloudera-scm-agent/config.ini.org
sudo sh -c "sed s/%SERVER_HOST%/`hostname`/ /etc/cloudera-scm-agent/config.ini.template > /etc/cloudera-scm-agent/config.ini"
```

```
$ sudo systemctl start cloudera-scm-agent
$ sudo systemctl start cloudera-scm-server
```
