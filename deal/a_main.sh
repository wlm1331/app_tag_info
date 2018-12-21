#! /bin/bash

#得到当前日期
currentDT=`date +%Y%m%d`
echo "currentDT="$currentDT

#将文本文件数据加载到app_tag_meta_info表中
echo "start load data to table process"
sh produce_app_tag_meta_info.sh $currentDT
echo "end"

#生成统计排序的热度标签数据
echo "start insert tag rank data"
sh produce_hot_tag_rank_rc.sh $currentDT
echo "end"

echo "all done!"
