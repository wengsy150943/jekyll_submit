$file = read-host "输入文件名"#不需要后缀
$time = get-date -f 'yyyy-MM-dd'
$name = echo $time'-doc.md'
$doc = Get-Content  $file".md" -Encoding utf8
$path = Split-Path -Parent $MyInvocation.MyCommand.Definition

$author = read-host "输入作者名"
$cate = read-host "输入分类"
$head = "---`nlayout: post`ntitle: "+$file+"`ndate: "+$time+"`nAuthor: "+$author+"`ncategories: "+$cate+"`ntags: ["

$first = 0
$flag = read-host "是否输入标签?[y/n]"
while($flag -eq 'y' -or $flag -eq 'yes'){
    if($first -ne 0){
        $head = $head+','
    }
    $tag = Read-Host "输出标签"
    $head = $head + $tag
    $flag = read-host "是否继续输入标签?[y/n]"
    $first = 1
}
$head = $head + "]`ncomments: true`n"
$flag = read-host "是否展开目录?[y/n]"
if($flag -eq 'y' -or $flag -eq 'yes'){
    $head = $head + "toc: true`n"
}
$flag = read-host "是否置顶?[y/n]"
if($flag -eq 'y' -or $flag -eq 'yes'){
    $head = $head + "pinned: true`n"
}

$head = $head + "---`n"
#echo $head+$doc > $name #-Encoding utf8
$res = $(echo $head $doc)
[System.IO.File]::WriteAllLines($name, $res)

$githubpath = #在这里输入仓库的本地地址
mv  -force $name $githubpath
cd $githubpath
git config --global user.name #在这里输入用户名
git config --global user.email #在这里输入用户邮箱
git add .
git commit -m $name
git pull
git push

cd $path
