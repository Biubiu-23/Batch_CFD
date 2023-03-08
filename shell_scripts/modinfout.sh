#!/bin/bash

#后处理
#假设WorkDir下有四个文件夹，对应计算四个迎角状态
#只需要改变各个下属文件夹下的infout1f.inp对应的迎角即可

WorkDir="/d/cfd"
modSubDirs=(
    "1-10"
    "2-12"
    "3-14"
    "4-16"
)

#需要更改的迎角分别为10° ... 16°
modValuesDirs=(10 12 14 16)


for i in "${!modSubDirs[@]}"; do
    filepath="$WorkDir/${modSubDirs[$i]}/infout1f.inp"
    if [ -f $filepath ]; then
        sed -ri 's/alpha .*/alpha '"${modValuesDirs[$i]}"'/g' $filepath
    else
        echo "$filepath does not exist"
    fi
done
