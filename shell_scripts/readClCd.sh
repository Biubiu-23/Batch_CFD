#!/bin/bash


#读取相关参数到.csv文件中
#注意，此脚本需要根据自己的需求更改，这里只是示例读取coefficient设置下的cl cd参数

WorkDir="/d/cfd"

readLine() {
    lineContent=$1
    idx=$2
    arr=(${lineContent// / })
    #判断数组元素是否存在，否则返回"err"
    echo "${arr[$idx]}"
}


project_name="${WorkDir##*/}"

echo "project_name: $project_name"

csvfile="$WorkDir/"$project_name"-alphaclcd.csv"

if [ -f "$csvfile" ]; then
    rm -rf "$csvfile"
fi

#获取cl cd
echo "cl,cd" >>$csvfile

for subdir in $(ls -A "$WorkDir"); do
    if [ -d $WorkDir/$subdir ]; then
        e1filepath="$WorkDir/$subdir/minfo1_e1"
        cl=
        cd=
        if [ -f "$e1filepath" ]; then
            lineContent=$(tail -1 "$e1filepath")
            cl=$(readLine "$lineContent" 8)
            cd=$(readLine "$lineContent" 9)
        fi
        echo "$cl,$cd" >>$csvfile
    fi
done
