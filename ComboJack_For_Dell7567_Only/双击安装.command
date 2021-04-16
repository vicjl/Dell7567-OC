#!/bin/bash

if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

cd "$( dirname "${BASH_SOURCE[0]}" )"

echo
echo "注意！！该版本修改过部分代码,所以仅适用于 ALC256 戴尔7567"
echo "如您错误的打开了该程序，请中止本程序"
echo "安装在非7567机型上出现任何问题自行解决"
echo "建议搭配AppleALC V1.4.7及以上版本，节点ID16以获得近乎完美的体验"
Echo "本人Github中的OC和群主Github中的Clover均已按上述条件配置"
echo "安装前请先查看安装说明"
echo "2021.04.09 V2"
echo "VicQ"
echo 

bash read -p '按任意键继续安装'

# Clean legacy stuff
#
sudo launchctl unload /Library/LaunchDaemons/com.XPS.ComboJack.plist 2>/dev/null
sudo launchctl unload /Library/LaunchDaemons/com.7567.ComboJack.plist 2>/dev/null
sudo rm -rf /Library/Extensions/CodecCommander.kext
sudo rm -f /usr/local/bin/ALCPlugFix
sudo rm -f /Library/LaunchAgents/good.win.ALCPlugFix
sudo rm -f /Library/LaunchDaemons/good.win.ALCPlugFix
sudo rm -f /usr/local/sbin/hda-verb
sudo rm -f /usr/local/share/ComboJack/Headphone.icns
sudo rm -f /usr/local/share/ComboJack/l10n.json

# install 
mkdir -p /usr/local/sbin
sudo cp ComboJack /usr/local/sbin
sudo chmod 755 /usr/local/sbin/ComboJack
sudo chown root:wheel /usr/local/sbin/ComboJack
sudo spctl --add /usr/local/sbin/ComboJack
sudo cp hda-verb /usr/local/sbin
#sudo chmod 755 /usr/local/sbin/hda-verb
#sudo chown root:wheel /usr/local/sbin/hda-verb
sudo mkdir -p /usr/local/share/ComboJack/
sudo cp Headphone.icns /usr/local/share/ComboJack/
sudo chmod 644 /usr/local/share/ComboJack/Headphone.icns
sudo cp l10n.json /usr/local/share/ComboJack/
sudo chmod 644 /usr/local/share/ComboJack/l10n.json
sudo cp com.XPS.ComboJack.plist /Library/LaunchDaemons/
sudo chmod 644 /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo chown root:wheel /Library/LaunchDaemons/com.XPS.ComboJack.plist
sudo launchctl load /Library/LaunchDaemons/com.XPS.ComboJack.plist
echo
echo "请重启！此外，在使用带麦克风的耳机时"
echo "最好关闭\"使用环境音降噪\" PS:使用建议版本的ALC及节点时可能不会出现该选项"
echo "再次提醒，该版本修改过部分代码,所以仅适用于 ALC256 戴尔7567"
echo "如您错误的安装在其他机型上，请点击\"双击卸载.command\"进行卸载操作"
echo "安装在非指定机型上出现问题烦请自行解决"
echo "部分内容汉化:\"VicQ"\"
echo 
echo
echo "你可以检查程序是否在IORegistry中工作："
echo "应该有一个名为\"VerbStubUserClient\"的设备连接到 "
echo " \"com_XPS_SetVerb\"其位于\"HDEF\"项层次结构中的某个位置。 "
echo
echo
exit 0

