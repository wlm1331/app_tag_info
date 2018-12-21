#! /bin/bash

source ../config/set_env.sh

updateDT=$1
db_name="wangliming"
tb_name="app_tag_meta_info"
jar_path=""
class_path=""
data_source_path="app_abstract_info.txt"

$HIVE -e "
  use $db_name;
  load data local inpath '$data_source_path'
   overwrite into table $tb_name partition(dt='$updateDT')
;
"
