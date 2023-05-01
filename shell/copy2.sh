#!/bin/bash

# 获取指定路径下文件列表
path=~/gpt/
if [ $# -eq 0 ]; then
    echo "没有指定路径，默认:$path"
    #read path
else
    path=$1
fi
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "path=$path dst:$DIR"

if [ ! -d $path ]; then
    echo "路径不存在"
    exit 1
fi

cd $path
count=0
for file in *; do
    count=$((count+1))
    echo "$count. $file"
done

# 处理用户输入
if [ $count -eq 0 ]; then
    echo "目录为空"
    exit 1
fi

read -p "输入要copy的文件序号，多个序号用空格分隔：" nums
for num in $nums
do
    if [ $num -gt 0 ] && [ $num -le $count ]; then
        file=$(ls | sed -n "${num}p")
	echo "$file"
        cp -f --preserve=all "$file" "$DIR"
    else
        echo "无效的序号 $num"
    fi
done

