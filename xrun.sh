#!/bin/bash

if [[ $1 == "start" ]]; then

   ./sbin/start-master.sh

elif [[ $1 == "slave" ]]; then

   ./sbin/start-slave.sh spark://mc10.cs.purdue.edu:7077 -c 1

elif [[ $1 == "pi" ]]; then
  
   ./bin/spark-submit --class org.apache.spark.examples.SparkPi --master spark://mc10.cs.purdue.edu:7077 /homes/dschatzl/scratch/spark/examples/target/spark-examples_2.10-1.4.1.jar 1000 

elif [[ $1 == "wordcount" ]]; then

  ./bin/spark-submit --class org.apache.spark.examples.JavaWordCount --master spark://mc10.cs.purdue.edu:7077 /homes/dschatzl/scratch/spark/examples/target/spark-examples_2.10-1.6.1.jar hdfs://mc10.cs.purdue.edu/dschatzl/output.txt

elif [[ $1 == "stop" ]]; then
   
   ./sbin/stop-slaves.sh

   ./sbin/stop-master.sh

elif [[ $1 == "build" ]]; then

  build/mvn -Pyarn -Phadoop-2.6 -Dhadoop.version=2.6.0 -DskipTests clean package

elif [[ $1 == "clean" ]]; then

  build/mvn -DskipTests clean

elif [[ $1 == "pysort" ]]; then

  ./bin/spark-submit --master spark://mc10.cs.purdue.edu:7077 /homes/dschatzl/scratch/spark/examples/src/main/python/sort.py hdfs://mc10.cs.purdue.edu/dschatzl/output.txt

fi

