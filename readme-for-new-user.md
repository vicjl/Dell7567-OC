# ***新手使用教程***

## 下载镜像
* 1. 准备一个16GB以上的U盘
* 2. 下载镜像，可以从黑果小兵的部落阁下载（[下载链接](https://blog.daliansky.net/categories/%E4%B8%8B%E8%BD%BD/)），选择系统，单击之后往下滑动找到下载处，使用双EFI版本的就行
<img src="https://gitee.com/vicjl/pic/raw/master/img/dmg.jpg" alt="dmg" />

* 3. 使用 [etcher](https://www.balena.io/etcher/) 向U盘写入镜像

<img src="https://gitee.com/vicjl/pic/raw/master/img/etcher1.jpg" alt="etcher" />

## 下载引导及替换
* 1.  ***通过Release下载新的OC-A*** ，下载完成后解压，得到BOOT和OC两个文件夹。
* 2. 将两个文件夹替换到U盘对应位置（即U盘的OC或ESP分区）或放在系统ESP中，这两个文件夹均为EFI文件夹的子文件夹。
* 3. 如果不显示盘符，可以通过 ***其他工具挂载或直接复制*** ，例如使用 [***DiskGenius***](https://www.diskgenius.cn/download.php) 软件进行写入，挂载操作（DiskGenius仅在Windows提供）。
### 建议将系统的ESP分区扩容至300MB以上，以免出现其他问题
### Tips：将OC-A中的BOOT、OC文件夹复制到系统ESP分区的EFI文件夹中可以免U盘启动

## 安装及使用
 ***前提：*** 
* BIOS设置:
  * 设置 `SATA Mode`为 `AHCI` ，自行百度；
  * 关闭 `Legacy Option ROMs`；
  * 关闭 `Secure Boot`；
  * 关闭 `VT ` (最好)；
  * 关闭 SGX；
#### 注意，将 `SATA Mode` 由 `Raid On` 修改为 `AHCI` 会使win无法正常启动，解决方法自行百度

### 添加启动项
* 1. 开机戴尔logo按F12

<img src="https://gitee.com/vicjl/pic/raw/master/img/biossetup.jpg" alt="biossetup" />

* 2. 选择Boot Sequence，点击Add Boot Option
<img src="https://gitee.com/vicjl/pic/raw/master/img/boot.jpg" alt="boot" />

* 3. 在Boot Option Name处输入启动项名称，输入你想显示文字，在File Name处选择OpenCore.efi
<img src="https://gitee.com/vicjl/pic/raw/master/img/ocefi0.jpg" alt="ocefi" />
<img src="https://gitee.com/vicjl/pic/raw/master/img/ocefi.jpg" alt="ocefi" />

* 4. Apply，Exit，重启，F12选择你刚才定义的启动项即可

#### Boot Sequence 左侧箭头可调整启动项顺序

### 概要：解锁CFG，Clover用户清理残留及NVRAM，使用OCC勾选网卡驱动

* 1. 如果你是Clover用户，切换引导，需要进行以下步骤。如果你是新用户，则跳过该步骤
  *  解决 Clover 和 OpenCore 的冲突
    * 使用Scripts中的脚本（清理Clover残留(Clover换OC用).command）进行清理
  * 重置「硬件」NVRAM
    * 为了尽可能减少问题出现的概率, 建议在 Clover 和 OpenCore 之间切换时重置「硬件」NVRAM
    * 进入OC界面按空格显示隐藏项选择Reset NVRAM
    * 该操作可能会使启动项清空，自行再次添加即可
<img src="https://gitee.com/vicjl/pic/raw/master/img/choose.jpg" alt="choose" />


* 2. 使用oc引导，进入引导后, ***按空格*** ，选择CheckCFGLock，检查当前是否已解锁CFG，若已解锁，可进行下一步，若未解锁，使用UnlockCFGLock，之后的界面输入y，重启并再次检查是否解锁，若仍未解锁，请再次尝试或按照其他方式解锁

<img src="https://gitee.com/vicjl/pic/raw/master/img/unlock.jpg" alt="unlock" />
<img src="https://gitee.com/vicjl/pic/raw/master/img/check.jpg" alt="check" />

#### 现在可以使用OC引导系统了

### 网卡驱动选择

* 1. 下载，解压OpenCore Configurator（简称为OCC），点击[这里](https://mackie100projects.altervista.org/opencore-configurator/) 下载，若网页无法打开请自行百度下载
<img src="https://gitee.com/vicjl/pic/raw/master/img/occ.jpg" alt="OCC" />

* 2. 用OCC打开 ***你实际使用的*** config.plist（若使用U盘启动则修改U盘中的对应文件，其他同理）
<img src="https://gitee.com/vicjl/pic/raw/master/img/occconfig.jpg" alt="config" />

* 3. 若没有显示盘符，则打开OCC，在上方选择工具→挂载EFI，对分区进行挂载
<img src="https://gitee.com/vicjl/pic/raw/master/img/mount.jpg" alt="mount" />
<img src="https://gitee.com/vicjl/pic/raw/master/img/efi1.jpg" alt="efi1" />

* 3. 在kernel-内核设置处勾选网卡驱动，Brcm即为博通
Intel即为英特尔
<img src="https://gitee.com/vicjl/pic/raw/master/img/ngff.jpg" alt="ngff" />

* 4. 保存关闭重启（即win+s，或直接点左上角红点，会提醒是否保存，或点击最上方的文件→保存）
