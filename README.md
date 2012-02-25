###0. 默认超级账户
如果电信没有改过你的猫账户，可以尝试使用下面的信息登陆，如果不可以在进入后面的步骤1和2破解
    帐号： telecomadmin 密码：nE7jA%5m (注意大小写)
###1. 下载配置文件
猫上插入U盘，下面两种方法都可以，您挑一种吧。
#####1.1 手工操作----乐趣
用猫后面印刷的普通用户useradmin登陆，这个用户登陆进去什么高级全选都木有，但是表着急，我这么干的，浏览器用firefox，如果木有就去下载，然后装上firebug，去看隐藏的html元素吧，把样式表的disply:none;都禁止掉，什么 备份配置文件、启动从U盘加载配置、回复出厂值、日志等等都出来了吧，插入U盘，点击备份按钮，文件就下载下来了。
#####1.2 连接下载----直接
同时通过分析html和javascript代码，我直接把下载地址找到了，如果你不想或者木有firefox&&firebug，那就直接访问：
[http://192.168.1.1/html/ehomeclient/cfgUSBRestore.cgi?coverusbpath=usb1_1](http://192.168.1.1/html/ehomeclient/cfgUSBRestore.cgi?coverusbpath=usb1_1) 这是firebug分析抓包后得到的地址，嘿嘿。
配置文件就能成功被备份出了，在U盘根目录生成的e8_Config_backup文件夹里ctce8_HG232.cfg。

###2. 解密配置文件
网上有现成的编译好的工具可以直接用，不过作为技术宅男，当然要做点有挑战性的了，我弄了俩，一个javascript写的，一个ruby写的，开源滴，您用着放心哦
#####2.1 无ruby环境
将代码库里的decrypt.html另存到本地，然后用浏览器打开，在Source里粘贴用ctce8_HG232.cfg文件的内容，
点击解密按钮,就可进行解密，加密同理。
#####2.2 有ruby环境
如果有ruby运行环境，则可以使用代码库里的decrypt.rb另存到本地来，把要破解或者加密的文件放入相同目录,在命令行运行 ruby decrypt.rb 按照提示做就可以了
#####2.3 超级管理员密码
到文本编辑软件打开破解后的文件，查找telecomadmin，找到

    <X_ATP_UserInfoInstance InstanceID="1" Username="telecomadmin" Userpassword="telecomadmin******" Userlevel="2" Busy="0" LoginIP=""/>


Userpassword里面的就是超级管理员的密码了。一般是telecomadmin加串数字。

###3. 设置
后面的情况就大同小异了，网上很多介绍，开路由，，自动拨号，开无线，一堆一堆的教程，另外有些设置在管理平台是没有的，比如下面的ftp和telnet设置，如果又必要使用这些相功能，修改配置文件，加密后，登陆后台后启用从usb恢复设备这个功能，然后把配置文件夹自己修改后，再恢复回去，就可以了。

    <X_CT-COM_ServiceManage TelnetEnable="0" TelnetUserName="!!Huawei" TelnetPassword="@HuaweiHgw" TelnetPort="23" WebWanAccessEnable="0" FtpEnable="1" FtpUserName="ftp" FtpPassword="ftp" FtpPort="21" FtpPath="/mnt"/>

###4.  其他
4个RJ45口理论上都可以设置成接电脑或者itv输出，并不局限于写了itv的那个口。另外，也可以增加一个itv无线网络，在你的机顶盒上加个无线网卡，机顶盒拨入此无线网络，这样就不用拉一堆堆的线了，很适用于前期没有做好布线设计的朋友。

itv 不选择 无线的话 要选VLAN透传，选无线是VLAN修改

另外，网上有现成的改好的配置文件下载，[http://email2me.blog.163.com/blog/static/34347033201101094128402/](http://email2me.blog.163.com/blog/static/34347033201101094128402/)
