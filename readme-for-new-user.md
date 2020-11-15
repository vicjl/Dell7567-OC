## ***新手使用教程***

### 添加启动项
* 1.开机戴尔logo按F12

<img src="https://gitee.com/vicjl/pic/raw/master/img/biossetup.jpg" alt="biossetup" />

* 2. 选择Boot Sequence，点击Add Boot Option
<img src="https://gitee.com/vicjl/pic/raw/master/img/boot.jpg" alt="boot" />

* 3. 在Boot Option Name处输入启动项名称，输入你想显示文字，在File Name处选择OpenCore.efi
<img src="https://gitee.com/vicjl/pic/raw/master/img/ocefi0.jpg" alt="ocefi" />
<img src="https://gitee.com/vicjl/pic/raw/master/img/ocefi.jpg" alt="ocefi" />

* 4. Apply，Exit，重启，F12选择你刚才定义的启动项即可

#### Boot Sequence 左侧箭头可调整启动项顺序

### 安装及使用
前提：
* BIOS设置:
  * 设置 `SATA Mode`为 `AHCI` ，自行百度；
  * 关闭 `Legacy Option ROMs`；
  * 关闭 `Secure Boot`；
  * 关闭 `VT ` (最好)；
  * 关闭 SGX；
  
概要：解锁CFG，Clover用户清理残留及NVRAM，使用OCC勾选网卡驱动

* 1.下载该仓库release中最新版的zip，解压，复制到efi中
* 2.如果你是Clover用户，切换引导，需要进行以下步骤。如果你是新用户，则跳过该步骤
  *  解决 Clover 和 OpenCore 的冲突
    * 使用Scripts中的脚本（清理Clover残留(Clover换OC用).command）进行清理
  * 重置「硬件」NVRAM
    * 为了尽可能减少问题出现的概率, 建议在 Clover 和 OpenCore 之间切换时重置「硬件」NVRAM
    * 进入OC界面按空格显示隐藏项选择Reset NVRAM
    * 该操作可能会使启动项清空，自行再次添加即可
<img src="https://gitee.com/vicjl/pic/raw/master/img/choose.jpg" alt="choose" />


* 3.使用oc引导，进入引导后,按空格，选择CheckCFGLock，检查当前是否已解锁CFG，若已解锁，可进行下一步，若未解锁，使用UnlockCFGLock，之后的界面输入y，即可解锁CFG，再次利用CheckCFGLock检查CFG锁状态
<img src="https://gitee.com/vicjl/pic/raw/master/img/unlock.jpg" alt="unlock" />
<img src="https://gitee.com/vicjl/pic/raw/master/img/check.jpg" alt="check" />

* 4.现在可以使用OC引导系统了

### 网卡驱动选择

* 1.下载，解压OpenCore Configurator（简称为OCC）
<img src="https://gitee.com/vicjl/pic/raw/master/img/occ.jpg" alt="OCC" />

* 2.用OCC打开config.plist
<img src="https://gitee.com/vicjl/pic/raw/master/img/occconfig.jpg" alt="config" />

* 3.在kernel-内核设置处勾选网卡驱动，Brcm即为博通
Intel即为英特尔
<img src="https://gitee.com/vicjl/pic/raw/master/img/ngff.jpg" alt="ngff" />

* 4.保存关闭重启

