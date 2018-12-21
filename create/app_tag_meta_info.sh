#! /bin/bash

source ../config/set_env.sh

db_name="wangliming"
tb_name="app_tag_meta_info"

$HIVE -e "
  use $db_name;
  create external table $tb_name(
    id string,
    name string,
    first_classify string,
    second_classify string,
    third_classify string,
    tags string
  )
  partitioned by (dt string comment 'update date')
  row format delimited fields terminated by '\t'
  lines terminated by '\n'
  stored as textfile;
"

