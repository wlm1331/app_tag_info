#! /bin/bash

source ../config/set_env.sh

updateDT=$1
db_name="wangliming"
tb_name="hot_tag_rank"

$HIVE -e "
  use $db_name;
  set hive.execution.engine=tez;
  insert overwrite table hot_tag_rank partition(dt='$updateDT')
  select tag,count(1) as freq from app_tag_meta_info
  lateral view explode(split(tags,',')) tag_table as tag
  where tag!='' and tag!='-' and dt='$updateDT' 
  group by tag 
  order by freq desc
"
