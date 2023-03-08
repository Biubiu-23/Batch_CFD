#!/bin/bash

TargetDir="/d/cfd"
PublicDir="/d/Public"

#1 将Public下的所有文件复制到cfd下的所有子文件夹中
for subdir in $(ls -A "$TargetDir"); do
    subdirPath="$TargetDir/$subdir"
    if [ -d "$subdirPath" ]; then
        echo "$subdirPath"
        for file in $(ls -A "$PublicDir"); do
            filePath="$PublicDir/$file"
            if [ -f "$filePath" ]; then
                cp $filePath $subdirPath
            fi
        done
    fi
done

#2 start_compute.bat,post-process.bat文件复制到cfd文件夹中
start_computefilePath="/d/start_compute.bat"
post_processfilePath="/d/post-process.bat"
mk_mcfdguifilPath="/d/mk_mcfdgui.bat"

cp $start_computefilePath $TartgetDir/$dir
cp $post_processfilePath $TartgetDir/$dir
cp $mk_mcfdguifilPath $TartgetDir/$dir

#完成
