<img src="./Screenshots/OpenCore_with_text_Small.png" width="200" height="48"/>

## ***使用前请仔细阅读该文本，着重阅读简述及安装注意事项***
* [Github](https://github.com/vicjl/Dell7567-OC)仓库已同步至[Gitee](https://gitee.com/vicjl/Dell7567-OC)，两个仓库会同步更新，有问题尽量在Github或者Q群提问
* 目前仍在完善中
* 交流QQ群：320693336进群验证为机型加OC，例：Dell7567-OC
****
* Dell7567-OC Release版本：[![Release](https://img.shields.io/github/v/release/vicjl/Dell7567-OC?color=green&include_prereleases&label=Release)](https://github.com/vicjl/Dell7567-OC/releases)
* OpenCore版本：[![Release](https://img.shields.io/github/v/release/acidanthera/OpenCorePkg?color=green&include_prereleases&label=Release)](https://github.com/acidanthera/OpenCorePkg/releases)
OpenCore每日自动构建版本：[![Release](https://img.shields.io/github/v/release/williambj1/OpenCore-Factory?color=orange&include_prereleases&label=Release)](https://github.com/williambj1/OpenCore-Factory/releases)
* OpenCore NDK版本：[![Release](https://img.shields.io/github/v/release/n-d-k/OpenCorePkg?color=green&include_prereleases&label=Release)](https://github.com/n-d-k/OpenCorePkg/releases)
* Clover版本：[![Release](https://img.shields.io/github/v/release/CloverHackyColor/CloverBootloader?color=green&include_prereleases&label=Release)](https://github.com/CloverHackyColor/CloverBootloader/releases)
* Lilu版本：[![Release](https://img.shields.io/github/v/release/acidanthera/Lilu?color=blue&include_prereleases&label=Release)](https://github.com/acidanthera/Lilu/releases)
VirtualSMC版本：[![Release](https://img.shields.io/github/v/release/acidanthera/VirtualSMC?color=blue&include_prereleases&label=Release)](https://github.com/acidanthera/VirtualSMC/releases)
****
# 配置详情
| 配置 / Hardware | 详情 / Detail|
| ------ | ------ |
| 型号 / Model | Dell Inspiron 15 7000 Gaming (7567) |
| 处理器 / CPU | Intel Core i5-7300HQ @ 2.50GHz |
| 内存 / Memory|  16 GB ( DDR4 2400MHz )|
| 硬盘 / HardDrive| Samsung SM961 256GB|
| 显卡 / Graphics Card| Intel HD Graphics 630 (platform-id:0x591B0000) |
| 声卡 / Sound Card | Realtek ALC256 ( layout-id:16)|
| 网卡 / Network Card | Dell DW1560 |

****
# 目录
* [简述](#简述)
  * [目前的bug](#目前的bug)
  * [目前无法驱动的硬件](#目前无法驱动的硬件)
  * [文件说明](#文件说明)
  * [安装说明](#安装说明)
* [ ***安装注意事项*** ](#安装注意事项部分节选自doapeat维护更新的7567clover版本和黑果小兵的部落阁)
  * [解决Clover和OpenCore的冲突 ](#解决-clover-和-opencore-的冲突)
  * [重置NVRAM](#重置硬件nvram)
  * [解锁CFG ](#解锁cfg建议解锁)
  * [OC中的原生开机快捷键组合](#OC中的原生开机快捷键组合)
* [英特尔wifi使用方法说明](#英特尔wifi使用方法说明)
* [rEFInd配置说明](#refind配置说明节选自远景论坛)
* [打赏](#你的打赏-是我更新的最大动力satisfied)
* [更新日志](#更新日志)
* [图集](#图集)
* [Credits](#credits)

****

# 简述
### [更新日志传送门](#更新日志) 2020.8.15更新
* 这是一个适用于Dell7567机型的OpenCore版本驱动。
* 官方OpenCore ~~需搭配rEFInd使用~~ 已经可以引导Windows。
* ~~我会提供rEFInd引导，想要直接使用，efi中OC的文件名必须为OC且该文件夹中必须有bootx64.efi，Clover文件名必须为Clover，rEFInd中各项配置的作用后面会有说明。~~ 不再提供rEFInd引导，配置说明会保留，可自行配置。
* 目前为止，包括i2c触控板，亮度快捷键，睡眠唤醒，耳麦，2.1声道都是完美的，使用过程中如果遇到什么问题请在群中交流或提交Issues。
* 该项目使用ComboJack作为耳麦驱动，需要使用ComboJack_For_Dell7567_Only中的文件安装切换弹窗部分，详细安装说明包含在文件中。
*  ~~目前并不支持Big Sur，想体验需要自行修改~~ 已经支持Big Sur，详见更新日志。
#### [回到目录](#目录)

## 目前的bug
* 暂缺英文版本的readme.md
* 目前的OC-A引导Windows已知问题是：会使QuickSet64中部分（显示Fn锁和数字键盘锁的托盘图标）失效。且目前并没有解决方案。
* 有关风扇的问题，~~因为切换到了VirtualSMC，所以目前没有办法采集到风扇信息，但是不会影响风扇正常运转。目前没有解决方案，一旦有解决方案我会同步更新。~~ 目前双风扇均已显示转速并可控。（需要注意的是无法精准控制风扇转速，这是自身的硬件决定的）
* ~~有线网卡版本问题会导致部分用户有线网卡无法驱动。（已定位问题，下个版本会修复）~~ 已解决。
* ~~OC-A引导Windows会导致无法调节亮度（已定位问题，下个版本会修复）~~ 已解决。
* 注意，在睡眠唤醒后低音炮可能会无声，调节一下音量即可。
#### [回到目录](#目录)

## 目前无法驱动的硬件
* NVIDIA GTX1050Ti（没有解决方案且以后应该也不会有）
  * 7567的HDMI接口是直连独显的，这会导致HDMI接口无法使用。
  * 由于Optimus技术，7567的独显1050Ti即使在10.13及以下MacOS版本也是无法驱动的。
* Intel Wireless 3165
    * 目前WIFi部分驱动不完善，速度不理想，客户端功能不完善。
    * 目前无法使用“接力”，“隔空投送”（大概率以后也不会支持）。
    
  ****
  
## 文件说明

* .DS_Store全称Desktop Services Store，是Mac OS中保存文件夹自定义属性的隐藏文件，目的在于存贮文件夹的自定义属性，例如文件图标位置、视图设置，或背景色等，相当于Windows下的 desktop.ini。由于我的OpenCore是在MacOS下更新的，所以每个文件夹中都会有这个文件，无视即可。
* OC-A为官方版本，OC-NDK为NDK修改版，两者均可引导双系统，但是官方版本目前有个小bug，上面已经说明。
* ACPI-Public文件夹中的文件是两个版本都会使用到的acpi补丁，将该文件夹中的所有文件移动到OC/ACPI中
* Kexts-All文件夹中的文件是两个版本都会使用到的驱动，将该文件夹中的所有文件移动到OC/Kexts中
* ComboJack_For_Dell7567_Only文件夹是耳机切换所需文件，按照文件夹的说明操作即可，[截图](#图集)
* Scripts提供了一些常用的脚本文件
* Unlock-CFG文件夹提供了解锁CFG所需文件，按该文对应[章节](#解锁cfg建议解锁)操作即可
* Software提供了一些软件（包括英特尔WIFI客户端）需要注意的是该文件夹下的软件可能不是最新的。

## 安装说明

#### 目前仍在测试，文件会有变动，未来几次的版本更迭建议将上一版的文件全部删除

* 使用Git或者主页的Download ZIP

  * 选择一个你想用的OC版本，将OC-X中的BOOT和OC两个文件夹复制到EFI中，添加引导时添加BOOT中的BOOTx64.efi即可。
  * 按[文件说明](#文件说明)补全ACPI、Kexts；
* 下载Release
  * 选择你要使用的版本，解压之后将BOOT和OC文件夹直接复制到EFI文件夹中即可
#### 使用方向键选择启动项后，按`Ctrl+Enter`键可以选择该项为默认启动项
#### [回到目录](#目录)
# 安装注意事项（部分节选自Doapeat维护更新的[7567Clover版本](https://github.com/Doapeat/Dell7567)和[黑果小兵的部落阁](https://blog.daliansky.net/OpenCore-BootLoader.html)）
* BIOS设置:
    * 设置 `SATA Mode`为 `AHCI` ，自行百度；
    * 关闭 `Legacy Option ROMs`；
    * 关闭 `Secure Boot`；
    * 关闭 `VT ` (最好)；
    * 关闭 SGX；
* `CPU变频驱动:`  7700HQ和7300HQ都已经定制了CPUFriend；需要自行定制的[看这里](https://github.com/stevezhengshiqi/one-key-cpufriend/blob/master/README_CN.md)；
* 自己（Doapeat）写了一些方便的脚本方便大家使用，在`Scripts`文件夹内，自行选择使用
### 需要注意，因为目前没有更多数据供参考，  ~~所以我推荐各位在使用Clover安装完成、解锁CFG、并可开机后再切换到OpenCore，保留Clover引导项以备不时之需~~ 目前可以使用OC直接安装，必须解锁CFG

## 解决 Clover 和 OpenCore 的冲突
### 清理Clover残留
#### 如果使用了Scripts中的脚本（清理Clover残留(Clover换OC用).command）进行清理，可以忽略这一小节，推荐使用脚本清理，方便快捷

```
删除 Clover 设置面板
  Clover 设置面板会和 OpenCore 产生冲突, 需要删除
  Clover 设置面板位于 /Library/PreferencePanes/Clover.prefPane
  终端输入 sudo rm -rf /Library/PreferencePanes/Clover.prefPane 删除
  清理 Clover 的模拟 NVRAM RC 脚本 和 守护程序 CloverDaemonNew

在终端中输入:
删除 ESP 分区下的 nvram.plist
rm -rf /Volumes/(你的 ESP 分区)/nvram.plist

删除 RC 脚本
rm -rf "/etc/rc.clover.lib"
rm -rf "/etc/rc.boot.d/10.save_and_rotate_boot_log.local"
rm -rf "/etc/rc.boot.d/20.mount_ESP.local"
rm -rf "/etc/rc.boot.d/70.disable_sleep_proxy_client.local.disabled"
rm -rf "/etc/rc.boot.d/80.save_nvram_plist.local"
rm -rf "/etc/rc.shutdown.local"
rm -rf "/etc/rc.boot.d"
rm -rf "/etc/rc.shutdown.d"

删除 Clover 新开发的 NVRAM 守护程序 `CloverDaemonNew`
launchctl unload '/Library/LaunchDaemons/com.slice.CloverDaemonNew.plist'
rm -rf '/Library/LaunchDaemons/com.slice.CloverDaemonNew.plist'
rm -rf '/Library/Application Support/Clover/CloverDaemonNew'
rm -rf '/Library/Application Support/Clover/CloverLogOut'
rm -rf '/Library/Application Support/Clover/CloverWrapper.sh'

```

### 重置「硬件」NVRAM
* 为了尽可能减少问题出现的概率, 建议在 Clover 和 OpenCore 之间切换时重置「硬件」NVRAM
* 可以通过 Clover F11 清除
  * 重启进入 Clover 引导项选择界面然后按下 F11 或 Fn+F11 即可重置NVRAM
* 可以通过OC清除
  * 进入OC界面按空格显示隐藏项选择Reset NVRAM
  * 该操作可能会使启动项清空，自行再次添加即可
#### [回到目录](#目录)

## 解锁CFG（建议解锁）
#### 需要注意，这个可能会有损坏硬件的风险（只要正常操作几乎不会）如果因此出现硬件损坏问题本人概不负责
#### 该版本适用于已解锁CFG的7567上使用，未解锁CFG的用户使用该OC版本 ~~可能~~ 一定会出问题。
* 在此处提供一个简单的方法
### 机型不是Dell 7567，请不要看下面的方法

<img src="./Screenshots/cfg1.png" alt="可以看到地址为0x4DE"  />

1.从上图中可以看到CFG lock的地址是`0x4DE`，默认是`开启`状态；

2.从我们的`modGRUBShell.efi`(可以像添加Clover启动项一样将这个efi文件添加为启动项)启动；

3.进入之后输入`setup_var_3 0x4DE`，查看返回值是不是`0x01`，如果不是请关闭或重启系统，查看上面两位大佬的教程重头来过；

4.如果是`0x01`，那么输入 `setup_var 0x4DE 0x00`，输入`reboot`重启系统，使用Hackintool可以看到下面的样子：

<img src="./Screenshots/cfg2.png" alt="检查解锁"  />


至此解锁完成！顺便把`启用HWP`勾上！
### 通用方法详见Doapeat的[README.md](https://github.com/Doapeat/Dell7567)
#### [回到目录](#目录)

## OC中的原生开机快捷键组合

* `Cmd + V`: 启用 -v 跑码
* `Cmd + Opt + P + R`: 重置 NVRAM
* `Cmd + R`: 启动恢复分区
* `Cmd + S`: 启动至单用户模式
* `Option / ALT`: 在 ShowPicker 设置成 NO 时显示引导项选择界面, ALT 不可用时可用 ESC 键代替
* `Cmd + C + 减号`: 关闭主板兼容性检查, 等同于添加引导标识符 -no_compat_check
* `Shift`: 安全模式
#### [回到目录](#目录)

# 英特尔wifi使用方法说明
### （驱动选用了zxystd的itlwm，详见[远景论坛](http://bbs.pcbeta.com/viewthread-1848662-1-1.html)；[Github](https://github.com/zxystd/itlwm)）
#### 注意，现在已经可以使用客户端进行连接操作，不过客户端还没有正式发出所以可能会有bug
* 首先,找到驱动（OC/Kexts/itlwm.kext）右键,显示包内容
<img src="./Screenshots/step1.jpg" alt="第一步"  style="zoom:30%;" />

* 找到info.plist,打开编辑
<img src="./Screenshots/step2.jpg" alt="第二步" style="zoom:30%;"  />

* 第三步,我这里是用xcode编辑,方便查看,用PlistEdit Pro也是可以的
* 将密码跟ssid换成你的Wi-Fi后保存重启即可
<img src="./Screenshots/step3.jpg" alt="第三步" style="zoom:30%;"  />

#### [回到目录](#目录)

# rEFInd配置说明（节选自[远景论坛](http://bbs.pcbeta.com/viewthread-1835917-1-1.html)）
提取了几个常用参数对refind.conf文件做一下说明：
其中的参数稍微有点多，但是我们不必深究，只需要注意我们能用到的那几个参数即可。
完整的参数请查看官方refind.conf-sample文件

```
timeout 60
// 这个是超时设置，启动后暂停多少秒然后进入系统
        ​shutdown_after_timeout false
// 顾名思义，在超时之后关机，设置true/false
​
use_nvram false
// 是否使用nvram保存你的refind设置，个人建议使用本地文件来保存NVRAM变量，官方也说了长期使用NVRAM保存会对其有损耗
​
hideui singleuser,arrows,hints,label
// 隐藏引导界面的一些选项依，常用参数有以下选项
// singleuser：针对macOS的单用户模式
// arrows：这个是当你引导香过多时，隐藏你的左右两侧箭头的图标（前提是你主题中制作了该图标）
// hints：隐藏引导界面底部对refind的简要说明和帮助
// label：隐藏引导项的菜单文字
// badges：隐藏设备类型的标签，比如你插入含引导项的U盘的话，该引导项右下角就会有一个USB标识
// all：全部隐藏
​
small_icon_size 96
// 这是比如关机、重启这类图标的尺寸
​
big_icon_size 256
// 这就是引导项的图标尺寸）
/* 关于图标尺寸，我建议设置为你制作好的主题图标原尺寸为宜，这样可以避免缩放失真，从而影响美观 */
​
resolution 2560 1440
// 分辨率设置，可以接受两个参数(X * Y)或者一个参数(X)
/* 这里详细说一下，默认不设置的话值为"0 0"，官方说此时会使用你系统分辨率默认值，通常是800x600。
当你使用1个参数来设置的时候，比如"0、1、2~10"等等，通过我的测试发现它的值是一个模式值数值表示(mode0,mode1~mode10),
有可能你的显示器并不支持你设置的分辨率(如"3840 2160")，然后启动后它就会显示你当前支持的所有模式，每个模式对应一个分辨率，然后你自己选择最适合你显示器分辨率填入即可 */
​
use_graphics_for osx,windows,linux
// 是否以图形化方式启动指定系统，默认refind会像OpenCore那样使用文字模式来启动系统，建议这里像我这样设置都使用图形化方式启动
​
showtools shutdown,reboot
// 显示哪些工具在你的引导项的下面，我只设置显示关机和重启，你需要更多项的话，参照官方Sample.conf文件完整说明
​
#dont_scan_tools ESP2:/EFI/ubuntu/mmx64.efi,gptsync_x64.efi
#scan_driver_dirs EFI/tools/drivers,drivers
#scanfor internal,external,optical,manual
#also_scan_dirs boot,ESP2:EFI/linux/kernels
#dont_scan_dirs ESP:/EFI/boot,EFI/Dell,EFI/memtest86
#dont_scan_dirs +ESP:/EFI/ubuntu
#dont_scan_files shim.efi,MokManager.efi
// 这几个一般不需要使用，除非你分区、启动项或efi驱动过多时可能需要
​
dont_scan_volumes "Macintosh HD","Recovery","Preboot"
// 使用分区卷名称来设置不扫描哪些卷，跟Clover的隐藏引导卷类似
​
dont_scan_dirs EFI_ESP:/EFI/APPLE,/EFI/CLOVER,/EFI/Microsoft/Boot,/EFI/OC
// 这个是设置不让refind扫面哪些目录，一般情况下我们只要自定义好了引导项，建议其它有.efi文件的目录都给添加上
​
scan_all_linux_kernels false
// 如果你没有Linux类系统的话，请设置为false，这样可以加快启动速度
​
/* 下面的是自定义启动项，这才是我们需要设置的 */
menuentry "OpenCore" {  // 引导项名称
icon /EFI/BOOT/themes/Regular/icons/2K/os_opencore.png  // 图标路径
loader /EFI/BOOT/BOOTx64-OC.efi  // efi启动文件路径
enable  // 此处设置启用/不启用(enable/disabled)此引导项
}
​
menuentry "Clover" {
icon /EFI/BOOT/themes/Regular/icons/2K/os_clover.png
loader /EFI/CLOVER/CLOVERX64.efi
disabled
}
​
include themes/Regular/theme-2K-dark.conf
// 引入主题的配置文件
```
#### [回到目录](#目录)

# 你的`打赏` 是我更新的最大动力:satisfied:

|微信:wink: |支付宝:wink:|
| :-: | :-: |
|<img src="./Screenshots/wechat.jpg" alt="微信" />|<img src="./Screenshots/ali.jpg" alt="支付宝" />|

# 更新日志
#### [回到目录](#目录)
### 2020.8.15 更新第四版
* 常规驱动更新
  * 需要注意，AirportBrcmFixup的PlugIns中含有两个驱动，已在Config中注明，并添加了最小最大内核限制，博通网卡用户可以把涉及WIFI的三个驱动全部选上，OC会根据你使用的系统版本选择对应驱动。
  * DW1820a网卡用户需要注意，在11.0 Big Sur 里，需要DeviceProperties中添加WIFI设备，并在常规添加的基础上添加名为compatible的键，字符类型，值为pci14e4,43a0。（由Q群群友`虐情`提供）
  * 添加驱动SystemProfilerMemoryFixup用来在“关于本机”中显示内存项，但是在11.0中暂不可用，原因同下。
  *  由于11.0禁用了CoreDisplay的用户空间修补， 所以4K屏暂时只能通过EDID将输出改为4K 48Hz以正常显示，暂时不建议4K屏用户更新11.0。原文`The user patcher used for Coredisplay was disabledin Lilu on Big Sur. So other kexts / functions relying on it such asSystemProfilerMemoryFixup should have broken as well. Just waitfor a fully functional Lilu first.`截取自`zhen-zen`在`Acidanthera`的`#1024Issue`中。
* 常规软件更新
* 尝试支持MacOS11.0 Big Sur，目前可进行11.0的全新安装
  * 11.0仍处于beta阶段，所以在11.0中遇到的任何问题都需要自行解决。目前只支持到当前的最新测试版（Beta4和Public Beta 1）。
* 添加、修改部分ACPI补丁
* 其他改进
* 由于OC-NDK版未更新，所以此次更新不包括OC-NDK版

### 2020.7.13 更新3.1版
* 修复有线网卡版本问题会导致部分用户有线网卡无法驱动的问题。
* 修复OC-A引导Windows会导致无法调节亮度的问题。

### 2020.7.7 第三版
  * 1.修改，添加，整合部分ACPI补丁；
  * 2.添加I2C速度常量SSCN、FMCN；
  * 3.为了尽可能显示更多的传感器信息，修改机型为mbp14,3；
  * 4.添加SMCDellSensors以显示，控制双风扇转速（推荐使用Macs Fan Control）；
  * 5.常规更新部分驱动；
  * 6.英特尔版本精简WIFI驱动并添加WIFI客户端HeliPort（类原生）并可使用客户端连接/切换WIFI（目前没有正式版所以可能会有bug，本人暂时没有发现明显bug，不过网速只能说是够用）；
  * 7.在节能中增加“电池健康”选项（只是一个UI，并无实际意义）下版本去掉；
  * 8.修正原生快捷键，cmd=win徽标键；
  * 9.为了OC的普适性，取消了英特尔和博通在config文件上的区分，并且为了DW1820a可以顺利安装，默认不勾选WIFi以及蓝牙驱动，安装完成后自行修改勾选即可。
  * 目前OpenCore官方版本仍在0.5.9，所以该版不支持BigSur，想上自行修改

### 2020.6.18 第二版
* 修改，添加，删除部分ACPI补丁；
* 更新官方OpenCore，可以引导Windows但会有bug，详情简述里有说明；
* 去除ApfsDriverLoader.efi，改为使用OC嵌入式驱动

### 2020.6.16 更新第一版

# 图集

<img src="./Screenshots/headphone.jpg" alt="耳机切换" />

<img src="./Screenshots/sensors.jpg" alt="传感器" />

<img src="./Screenshots/wifi.jpg" alt="英特尔WIFI客户端" />

<img src="./Screenshots/about.jpg" alt="关于" />

<img src="./Screenshots/touchpad.jpg" alt="触控板多指"  />

<img src="./Screenshots/gpio.jpg" alt="触控板GPIO中断" />

<img src="./Screenshots/frequency.jpg" alt="变频" />

<img src="./Screenshots/brightness.jpg" alt="亮度快捷键" />

<img src="./Screenshots/3165.jpg" alt="原生无线网卡wifi" />

<img src="./Screenshots/crw.jpg" alt="SD读卡器" />

# Credits
* Acidanthera团队的Opencore

* Doapeat维护的Dell7567 Clover

* VicQ维护的Dell7567-OC

* 宪武制作的OC-Little补丁

* Daliansky的OpenCore详解

* XJN的OpenCore详解

* SukkaW的`从Clover到OpenCore`

  

# 感谢浏览！
