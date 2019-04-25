# To-DO List

## 未分配

* /etc/ssh/sshd_config
```
echo "UseDNS no" >> /etc/ssh/sshd_config
```
* hostname
```
hostname master
hostname slave1
hostname slave2

echo $(hostname) > /etc/hostname
```
* /etc/hosts
```
echo "192.168.1.201 master" >> /etc/hosts
echo "192.168.1.202 slave1" >> /etc/hosts
echo "192.168.1.203 slave2" >> /etc/hosts
```
* firewalld
```
systemctl stop firewalld
systemctl disable firewalld
```
* ssh-keygen
```
ssh-keygen -t rsa
scp ~/.ssh/id_rsa.pub master:~/.ssh/$(hostname)

# Only master
cd ~/.ssh
cat master > authorized_keys
cat slave1 >> authorized_keys 
cat slave2 >> authorized_keys
scp authorized_keys slave1:~/.ssh/authorized_keys
scp authorized_keys slave2:~/.ssh/authorized_keys

# All
ssh master
ssh slave1
ssh slave2
```
* /etc/profile
* tar *.tar.gz *.tgz
```
for tar in /opt/soft/*.{gz,tgz} ;do tar -vxzf $tar -C /usr ;done

vi tar.sh

for tar in /opt/soft/*.{gz,tgz}
do
    (tar zxf $tar -C /usr ; echo "$tar done") &
done
wait

source tar.sh
```
* Configure-Zookeeper
* Configure-Hadoop
* Configure-NTP
* Configure-Spark
* Start Service
* Final Check

## Person #1

## Person #2

## Person #3
