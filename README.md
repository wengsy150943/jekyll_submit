# jekyll_submit
基于powershell，实现对github page中jekyll的lofter模板的一键提交。
##初始配置
将submit.ps1下载在文本的对应文件夹里，打开submit.ps1，按注释修改有关github和git的参数，保存。

需要修改的部分在脚本文件的最后部分，如下：
```shell
$githubpath = #在这里输入仓库的本地地址
mv  -force $name $githubpath
cd $githubpath
git config --global user.name #在这里输入用户名
git config --global user.email #在这里输入用户邮箱
```
##使用
右键使用powershell运行，按说明填写即可。输入文件名时不需要后缀。
##注意
目前只支持markdown，脚本使用GBK编码，若打开有乱码请使用GBK编码打开。

目前一天只支持上传一篇，多次上传会覆盖前者。

放假后可能会推出图形化版本？
