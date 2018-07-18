#!/usr/bin/env bash
#编译+部署hello站点

#需要配置如下参数
# 项目路径, 在Execute Shell中配置项目路径, pwd 就可以获得该项目路径
# export PROJ_PATH=这个jenkins任务在部署机器上的路径

# 输入你的环境上HELLO的全路径
# export HELLO_APP_PATH=hello在部署机器上的路径

### base 函数
killHello()
{
    pid=`ps -ef|grep hello|grep java|awk '{print $2}'`
    echo "hello Id list :$pid"
    if [ "$pid" = "" ]
    then
      echo "no hello pid alive"
    else
      kill -9 $pid
    fi
}
cd $PROJ_PATH/hello
mvn clean install

# 停killHello
killHello

# 删除原有工程
rm -f $HELLO_APP_PATH/hello.jar

# 复制新的工程
cp $PROJ_PATH/hello/target/hello-0.0.1-SNAPSHOT.jar $HELLO_APP_PATH/

# 重命名
cd $HELLO_APP_PATH
mv hello-0.0.1-SNAPSHOT.jar hello.jar

# 启动hello并且设置为后台运行
java -jar hello.jar &



