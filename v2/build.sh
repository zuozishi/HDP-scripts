#! /bin/bash

echo "--------------------------"
echo "|                        |"
echo "|       All in one       |"
echo "|                        |"
echo "--------------------------"

if ( test -d ./build ) ;then
    rm -rf ./build
fi
mkdir ./build

#压缩脚本
echo "压缩脚本..."
master_sh=$(base64 master.sh | sed ':t;N;s/\n//;b t')
slave_sh=$(base64 slave.sh | sed ':t;N;s/\n//;b t')
check_sh=$(base64 check.sh | sed ':t;N;s/\n//;b t')
sshpass_bin=$(base64 sshpass | sed ':t;N;s/\n//;b t')

#压缩配置文件
echo "压缩配置文件..."
conf_core=$(base64 ./conf/core-site.xml | sed ':t;N;s/\n//;b t')
conf_hdfs=$(base64 ./conf/hdfs-site.xml | sed ':t;N;s/\n//;b t')
conf_mapred=$(base64 ./conf/mapred-site.xml | sed ':t;N;s/\n//;b t')
conf_yarn=$(base64 ./conf/yarn-site.xml | sed ':t;N;s/\n//;b t')

#生成解压脚本
echo "生成解压脚本..."
echo -e "#! /bin/bash\n\
\n\
master_sh=\"${master_sh}\"\n\
slave_sh=\"${slave_sh}\"\n\
check_sh=\"${check_sh}\"\n\
sshpass_bin=\"${sshpass_bin}\"\n\
\n\
conf_core=\"${conf_core}\"\n\
conf_hdfs=\"${conf_hdfs}\"\n\
conf_mapred=\"${conf_mapred}\"\n\
conf_yarn=\"${conf_yarn}\"\n\
\n\
echo \$master_sh | base64 -d > master.sh\n\
echo \$slave_sh | base64 -d > slave.sh\n\
echo \$check_sh | base64 -d > check.sh\n\
echo \$sshpass_bin | base64 -d > sshpass\n\
chmod 777 sshpass\n\
\n\
mkdir ./conf\n\
echo \$conf_core | base64 -d > ./conf/core-site.xml\n\
echo \$conf_hdfs | base64 -d > ./conf/hdfs-site.xml\n\
echo \$conf_mapred | base64 -d > ./conf/mapred-site.xml\n\
echo \$conf_yarn | base64 -d > ./conf/yarn-site.xml\n\
chmod 777 *.sh\n\
echo 'Decode Complete'" > ./build/setup.sh

chmod 777 ./build/setup.sh
cp ./build/setup.sh ./build/setup.sh.1
gzip ./build/setup.sh.1
mv ./build/setup.sh.1.gz ./build/setup.sh.gz
(base64 ./build/setup.sh.gz | sed ':t;N;s/\n//;b t') > ./build/setup.b64

echo "打包完成："
size=$(ls -l ./build/setup.sh | awk '{ print $5 }')
let size=$size/1000
echo "setup.sh $size KB"
size=$(ls -l ./build/setup.sh.gz | awk '{ print $5 }')
let size=$size/1000
echo "setup.sh.gz $size KB"
size=$(ls -l ./build/setup.b64 | awk '{ print $5 }')
let size=$size/1000
echo "setup.b64 $size KB"