#!/bin/bash

#假设WorkDir下有四个文件夹，对应计算四个迎角状态
#只需要改变各个下属文件夹下的mcfd.inp对应的迎角即可

WorkDir="/d/cfd"

#子文件夹名
modSubDirs=(
    "1-10"
    "2-12"
    "3-14"
    "4-16"
)

#对应的计算迎角大小
modValuesDirs=(10 12 14 16)


#修改mcfd.inp的迎角
for firstsubDirs in $(ls -A "$WorkDir"); do
    firstsubDirPath="$WorkDir/$firstsubDirs"
    echo "$firstsubDirPath"
    if [ -d "$firstsubDirPath" ]; then
        for i in "${!modSubDirs[@]}"; do
            filepath="$firstsubDirPath/${modSubDirs[$i]}/mcfd.inp"
            if [ -f $filepath ]; then
                sed -ri 's/aero_alpha .*/aero_alpha '"${modValuesDirs[$i]}"'e+000/g' $filepath
            else
                echo "$filepath does not exist"
            fi
        done
    fi
done
