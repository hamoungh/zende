#/ $HADOOP_INSTALL=/usr/local/hadoop-0.19.0
#hadoop jar $HADOOP_INSTALL/contrib/streaming/hadoop-*-streaming.jar \
#-D mapred.reduce.tasks=0 \
#-D mapred.map.tasks.speculative.execution=false \
#-D mapred.task.timeout=12000000
#-input ncdc_files.txt \
#-inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \
#-output output
#-mapper load_ncdc_map.sh \
#-file load_ncdc_map.sh
#read input output

if [ -z $1 ]; then
  echo "inout and output required!" 
  exit -1
fi


HADOOP_INSTALL=/usr/local/hadoop-0.19.0
hadoop jar $HADOOP_INSTALL/contrib/streaming/hadoop-*-streaming.jar \
-D mapred.output.compress=false \
-input $1 \
-output $2 \
-mapper get_num_request_map.rb \
-reducer get_num_request_reduce.rb \
-file get_num_request_map.rb \
-file get_num_request_reduce.rb
