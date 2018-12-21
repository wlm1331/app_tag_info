#! /bin/bash

source ../config/set_env.sh

db_name="wangliming"
tb_name="hot_tag_rank"

$HIVE -e "
  use $db_name;
  create  table $tb_name(
    tag string,
    freq int
  )
  partitioned by (dt string comment 'update date')
  row format delimited fields terminated by '\t'
  lines terminated by '\n'
  stored as textfile;
"

