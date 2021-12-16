#! /usr/bin/env bash

# 查询 IP 信息，未提供 IP 时默认查询本机
iip() {
    info=(`curl -s http://ip-api.com/line/$1\?fields\=country,regionName,city,isp,query\&lang\=zh-CN`)
    inet=`ifconfig en0 | grep -w "inet" | cut -f2 -d" "`
    infolen=${#info[@]}
    if [ ! $1 ]; then
        echo "内网IP：$inet"
    fi

    # echo ${info[infolen-4]}
    echo "公网IP：${info[-1]}" # 负索引只支持 Bash 4.3 或以上
    # echo "公网IP：${info[infolen-1]}"
    echo "归属地：${info[@]:0:3}"
     echo "运营商：${info[@]:3:-1}" # Bash 4.3
    # echo "运营商：${info[@]:3:infolen-4}"
}

# 像 ping 一样用 nc（如多端口只测一次）
inc() {
    # 参数少于两个时直接退出
    if [ $# -lt 2 ]; then
        echo "请提供 IP 和 端口"
        break
    # 参数如果等于两个，则重复测试指定端口，直到连通
    elif [ $# -eq 2 ]; then
        while true; do
            # 如果成功则退出，失败时重复执行
            if nc -vz -G3 $@; then
                break
            fi
            sleep 2
        done
    # 参数大于两个时，循环测试多个端口
    elif [ $# -ge 2 ]; then
        for i in ${@:2}; do
            nc -vz -G2 $1 $i
            sleep 1
        done
    fi
}

# 创建文件夹并跳转到目录（如同时创建多个，则跳转到最后一个）
mkcd() {
    mkdir $* && cd ${$#}
}

# 重复执行指定命令
watch() {
    while; do
        $@
        sleep 3
    done
}
