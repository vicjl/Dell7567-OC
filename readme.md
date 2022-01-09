<img src="https://gitee.com/vicjl/pic/raw/master/img/OpenCore_with_text_Small.png" width="200" height="48"/>

## ***这是一个适用于Dell7567机型的OpenCore版本驱动。***
* [Github](https://github.com/vicjl/Dell7567-OC)仓库已同步至[Gitee](https://gitee.com/vicjl/Dell7567-OC)，两个仓库会同步更新，如果出现Github图片加载不全或release下载失败等情况请通过Gitee访问。有问题尽量在Github或者Q群提问
* 交流QQ群：320693336  进群验证为机型加OC，例：Dell7567-OC
* Dell7567-OC Release版本：[![Release](https://img.shields.io/github/v/release/vicjl/Dell7567-OC?color=green&include_prereleases&label=Release)](https://github.com/vicjl/Dell7567-OC/releases)  ***（新手请点击该图标下载OC-A若无法打开，请尝试点击右侧的 `Releases` 或 `发行版` 下载最新版本 ，不要点上面的下载，不要点上面的下载，不要点上面的下载！）*** 
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
* 收到部分用户反馈：bios版本更新后会使低音单元无声，本人测试没有出现该问题，但仍不建议用户更新新版bios。
* ***如果出现有线网卡无法使用的情况，请切换RealtekRTL8111.kext至2.2.2版本*** 
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
|<img src="https://raw.githubusercontent.com/vicjl/pic/main/wechat.jpg" alt="微信" />|<img src="https://raw.githubusercontent.com/vicjl/pic/main/ali.jpg" alt="支付宝" />|

# Q&A
### Q:这是什么？
A:  这是一个适用于Dell7567机型的OpenCore版本驱动。

### Q: 我怎么没有看到博客地址？
A:博客尚未搭建完成，搭建完成会更新到readme.md里的

### Q:为什么使用本OC启动后不管无线网卡是什么都不能用？
A:为了该OC可以普遍适用于博通、英特尔网卡，并且为了避免一些卡死，崩溃之类的问题，默认没有勾选网卡驱动，请根据实际情况自行勾选。

### Q:为什么该OC里有两个AirportItlwm.kext？
A:AirportItlwm.kext区分系统版本，请根据实际使用的系统版本自行选择。
PS：Intel网卡用户注意，该版本使用AirportItlwm作为wifi驱动，使用原生gui，无需使用heliport。定位，接力，智能热点已经可以使用（需要更多反馈）（仅10.15和11.0可使用，其余版本请自行解决）

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

### 2021.06.09 更新第七版
* 常规驱动更新
* 常规OC更新
* MacOS12未经测试，但理论支持，希望尝鲜的用户请自行尝试
* 该版变化不大，如有问题请在群里提问或在Github提问，如遇无法启动等问题请先切换回旧版使用，反馈后等待更新

### 2021.01.19 更新第六版
* 正式支持Big Sur 11.0
* 常规驱动更新
 * 更新RealtekRTL8111.kext 至2.4.0b6，尝试解决2.3.0版本必须手动配置硬件才能使用的问题（即2.3.0无法使用有线联网问题）
 * 新版Whatevergreen.kext解决Big Sur 11.0 4k问题


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
