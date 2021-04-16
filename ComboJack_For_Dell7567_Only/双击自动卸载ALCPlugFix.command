#!/bin/bash


path=${0%/*}
sudo launchctl remove /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo rm -rf /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo rm -rf /usr/bin/ALCPlugFix

echo "ALCplugfix卸载完成"
echo
echo "10.15及以下建议重建缓存，11.0以上使用了ALCPlugFix的用户请使用安装时附属的卸载程序进行卸载"
echo 
bash read -p '按任意键以完成'
exit 0