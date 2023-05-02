#!/bin/bash
# 编译op前准备
echo "Running update and install feed..."
# update
./scripts/feeds update -a
./scripts/feeds install -a


if [[ $1 == "-y" ]]; then
  # 自动执行
  echo "make defconfig"
  make defconfig
  echo "make download -j8"
  make download -j8
else
  # 手动询问是否执行update2
  read -n 1 -r -p "make defconfig now? (y/n) " answer
  echo
  if [[ $answer == [Yy] ]]; then
    echo "make defconfig"
    make defconfig
  fi

  # 手动询问是否执行update3
  read -n 1 -r -p "make download -j8 now? (y/n) " answer
  echo
  if [[ $answer == [Yy] ]]; then
    echo "make download -j8"
    make download -j8
  fi
fi
