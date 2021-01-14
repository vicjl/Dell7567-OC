<img src="https://gitee.com/vicjl/pic/raw/master/img/OpenCore_with_text_Small.png" width="200" height="48"/>

## ***这是一个适用于Dell7567机型的OpenCore版本驱动。***
* [Github](https://github.com/vicjl/Dell7567-OC)仓库已同步至[Gitee](https://gitee.com/vicjl/Dell7567-OC)，两个仓库会同步更新，如果出现Github图片加载不全或release下载失败等情况请通过Gitee访问。有问题尽量在Github或者Q群提问
* 交流QQ群：320693336  进群验证为机型加OC，例：Dell7567-OC
* Dell7567-OC Release版本：[![Release](https://img.shields.io/github/v/release/vicjl/Dell7567-OC?color=green&include_prereleases&label=Release)](https://github.com/vicjl/Dell7567-OC/releases)  ***（新手请点击该图标下载OC-A若无法打开，请尝试点击右侧的 `Releases` 或 `发行版` 下载最新版本 ，不要点上面的下载）*** 
* 目前为止，包括i2c触控板，亮度快捷键，睡眠唤醒，耳麦，2.1声道都是完美的，使用过程中如果遇到什么问题请及时交流沟通。
* 该项目使用ComboJack作为耳麦驱动，需要使用ComboJack_For_Dell7567_Only中的文件安装切换弹窗部分，详细安装说明包含在文件中
*  已经支持Big Sur且后续更新不包含OC-NDK版
* 使用本OC必须解锁CFG，菜单中已经包含一键解锁选项
* 如果你是纯新手，点 [纯新手教程](./readme-for-new-user.md)
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
* [目前的bug](#目前的bug)
* [目前无法驱动的硬件](#目前无法驱动的硬件)
* [安装说明](#安装说明)
* [打赏](#你的打赏-是我更新的最大动力satisfied)
* [Q&A](#Q&A)
* [更新日志](#更新日志)
* [图集](#图集)
* [Credits](#credits)

****

## 目前的bug
* 目前的OC-A引导Windows已知问题是：会使QuickSet64中部分（显示Fn锁和数字键盘锁的托盘图标）失效。目前并没有解决方案。
* 目前双风扇均已显示转速，可使用Macs Fan Control控制转速。（无法精准控制风扇转速，这是自身的硬件决定的）
* 注意，在睡眠唤醒后低音炮可能会无声，调节一下音量即可。
#### [回到目录](#目录)

## 目前无法驱动的硬件
* NVIDIA GTX1050Ti（没有解决方案且以后应该也不会有）
  * 7567的HDMI接口是直连独显的，这会导致HDMI接口无法使用。
  * 由于Optimus技术，7567的独显1050Ti即使在10.13及以下MacOS版本也是无法驱动的。
* Intel Wireless 3165
    * 目前WIFi部分驱动不完善，速度不理想。
    * 目前无法使用 “隔空投送”。
    
  ****
  
## 安装说明
* 内容已移至新手教程
#### 使用方向键选择启动项后，按`Ctrl+Enter`键可以选择该项为默认启动项
#### [回到目录](#目录)


# 你的`打赏` 是我更新的最大动力:satisfied:

|微信:wink: |支付宝:wink:|
| :-: | :-: |
|<img src="https://gitee.com/vicjl/pic/raw/master/img/wechat.jpg" alt="微信" />|<img src="https://gitee.com/vicjl/pic/raw/master/img/ali.jpg" alt="支付宝" />|

# Q&A
### Q:这是什么？
A:  这是一个适用于Dell7567机型的OpenCore版本驱动。

### Q: 我怎么没有看到博客地址？
A:博客尚未搭建完成，搭建完成会更新到readme.md里的

### Q:  .DS_Store是什么？为什么会有这个文件？
A:  .DS_Store全称Desktop Services Store，是Mac OS中保存文件夹自定义属性的隐藏文件，目的在于存贮文件夹的自定义属性，例如文件图标位置、视图设置，或背景色等，相当于Windows下的 desktop.ini。由于我的OpenCore是在MacOS下更新的，所以每个文件夹中都会有这个文件，无视即可。

### Q: 为什么下载的压缩文件中会有_MACOSX这个文件夹？
A: 节选自网上的解释：
* 由于MacOS系统的关系，在MacOS下的每个文件都有记录其媒体信息的文件，然而这文件是带有隐藏属性的。你移动和复制文件的时候这个记录文件会跟随你操作的文件一起移动和复制的。
* 苹果的MacOS系统在压缩文件的同时，还往里面写入了一些”MetaData“信息（记录媒体信息的文件）一并压缩到压缩包里面，这样做的目的是为了方便其它的 Mac 用户 使用，就像Windows 会在图片目录下加入的Thumbs.db以方便显示预览图一样。存储这些信息记录文件产生的文件夹就是 “__MACOSX” 。但是大部分人都是 Windows 操作系统，而 Windows 又是从不鸟苹果的，“__MACOSX” 在Windows 下就成了垃圾文件。相反的是 Windows 的 “Thumbs.db” 在 Mac 系统下成了垃圾文件。

* “__MACOSX” 里面的文件记录的信息一般都是浏览文件夹时候的文件夹里面的文件的图标大小和摆放位置（MacOS是可以指定单个文件夹里面的图标的显示大小）、文件的日期类信息、访问记录以及是否是从网络上下载的等等。

# 更新日志
#### [回到目录](#目录)

## 自第五版起仅保留最近两次更新日志，其余日志已转移至博客
### 2020.11.15 更新第第五版
* 支持big sur 11.0
* 修复部分用户无法调节亮度的问题
* 收到部分用户反馈：bios版本更新后会使低音单元无声，本人测试没有出现该问题，但仍不建议用户更新新版bios
* 4k用户需要注意，目前驱动仍未针对用户修补空间修复，所以4k用户升级big sur 需要添加edid（自行解决或者等待博客搭建完毕）
* 常规驱动更新
* Intel网卡用户注意，该版本使用AirportItlwm作为wifi驱动，使用原生gui，无需使用heliport。定位，接力，智能热点已经可以使用（需要更多反馈）（仅10.15和11.0可使用，其余版本请使用itlwm）
* 添加一键解锁CFG和检查CFG锁状态，对应OC菜单中的UnlockCFGLock以及Check CFGLock，（一键解锁CFG的efi由群友 '虐情' 提供）

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

# 图集

<img src="https://gitee.com/vicjl/pic/raw/master/img/headphone.jpg" alt="耳机切换" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/sensors.jpg" alt="传感器" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/wifi.jpg" alt="英特尔WIFI客户端" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/about.jpg" alt="关于" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/touchpad.jpg" alt="触控板多指"  />

<img src="https://gitee.com/vicjl/pic/raw/master/img/gpio.jpg" alt="触控板GPIO中断" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/frequency.jpg" alt="变频" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/brightness.jpg" alt="亮度快捷键" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/3165.jpg" alt="原生无线网卡wifi" />

<img src="https://gitee.com/vicjl/pic/raw/master/img/crw.jpg" alt="SD读卡器" />

# Credits
* Acidanthera团队的Opencore

* Doapeat维护的Dell7567 Clover

* VicQ维护的Dell7567-OC

* 宪武制作的OC-Little补丁

* Daliansky的OpenCore详解

* XJN的OpenCore详解

* SukkaW的`从Clover到OpenCore`

  

# 感谢浏览！
