#!/bin/bash
# 编译op前准备

# 更新feeds文件
function update_feeds() {
    echo "Running update and install feed..."
    ./scripts/feeds update -a
    ./scripts/feeds install -a
}

# 执行make defconfig
function make_defconfig() {
    echo "make defconfig"
    make defconfig
}

function make_download() {
    echo "make download -j8"
    make download -j8
}
# 根据参数执行相应操作
# 1. -u|--update 更新feeds文件
# 2. -d|--defconfig 执行make defconfig
# 3. -m|--download 执行make download -j8
# shift 命令用于对参数的移动(左移)
all=false
update=false
defconfig=false
download=false

while [[ $# -gt 0 ]]; do
    case $1 in
        -u|--update)
            update=true
            shift
            ;;
        -d|--defconfig)
            defconfig=true
            shift
            ;;
        -m|--download)
            download=true
            shift
            ;;
        -a)
            all=true
            shift
            ;;
        *)
            echo "无效的选项: $1"
            shift
            ;;
    esac
done

if $all || $update; then
    update_feeds
fi

if $all || $defconfig; then
    make_defconfig
fi

if $all || $download; then
    make_download
fi

# if [[ $1 == "-y" ]]; then
#   # 自动执行
#   echo "make defconfig"
#   make defconfig
#   echo "make download -j8"
#   make download -j8
# else
#   # 手动询问是否执行update2
#   read -n 1 -r -p "make defconfig now? (y/n) " answer
#   echo
#   if [[ $answer == [Yy] ]]; then
#     echo "make defconfig"
#     make defconfig
#   fi

#   # 手动询问是否执行update3
#   read -n 1 -r -p "make download -j8 now? (y/n) " answer
#   echo
#   if [[ $answer == [Yy] ]]; then
#     echo "make download -j8"
#     make download -j8
#   fi
# fi
