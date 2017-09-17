#sample scripts like sciprt1 , script2 needs to be at same path as orchestartion script
echo "Enter comma seperated software package names from the below list you want to install on this machine. Please make sure you type in exact name as in list. Please type ALL if you want to setup all at once on a Single Machine"
echo "1)insights_first
2)insights_java
3)insights_es
4)insights_neo4j
5)insights_postgres
6)insights_grafana
7)insights_python
8)insights_rabbitmq
9)insights_tomcat7
10)inisghts_war
11)insights_enginejar
12)insights_ui
13)insights_initscripts
14)insights_all"
read input
for package in ${input[@]}
do
case $package in
   "insights_first") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_first.sh -O insights_first.sh  && sh insights_first.sh
   ;;
   "insights_java") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_java.sh -O insights_java.sh && sh insights_java.sh
   ;;
   "insights_es") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_es.sh -O insights_rabbitmq.sh  && sh insights_es.sh
   ;;
   "insights_neo4j") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_neo4j.sh -O insights_neo4j.sh && sh insights_neo4j.sh
   ;;
   "insights_postgres") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_postgres.sh -O insights_postgres.sh && sh insights_postgres.sh
   ;;
   "insights_grafana") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_grafana.sh -O insights_grafana.sh && sh insights_grafana.sh
   ;;
   "insights_python") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_python.sh -O insights_python.sh && sh insights_python.sh
   ;;
   "insights_rabbitmq") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_rabbitmq.sh -O insights_rabbitmq.sh && sh insights_rabbitmq.sh
   ;;
   "insights_rabbitmq") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_tomcat7.sh -O insights_tomcat7.sh && sh insights_tomcat7.sh 
   ;;
   "insights_war") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_war.sh -O insights_war.sh && sh insights_war.sh
   ;;
   "insights_ui") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_ui.sh -O insights_ui.sh  && sh insights_ui.sh
   ;;
   "insights_enginejar") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_enginejar.sh -O insights_enginejar.sh && sh insights_enginejar.sh
   ;;
   "insights_initscripts") wget http://platform.cogdevops.com/InSightsV1.0/initscripts/insights_initscripts.sh -O insights_initscripts.sh && sh insights_initscripts.sh
   ;;   
   "insights_all") wget http://platform.cogdevops.com/InSightsV1.0/scripts/insights_all.sh -O insights_all.sh && sh insights_all.sh
   ;;
   *) echo "$package Not present"
esac
done