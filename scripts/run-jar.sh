# Get where the file was placed
filelocation=$(get_octopusvariable "Octopus.Action[Deploy Java Archive].Output.Octopus.Action.Package.InstallationPackagePath")

echo "Octopus placed the deployed .jar here: $filelocation"

# echo "Checking to see if there is a running process for the jar"
# jarPid=$(ps -ef | grep -v grep | grep logging-log4j2.jar| awk '{print $2}')

# # Check to see if something was returned
# if [ -z "$jarPid" ]; then
#     echo "No running process found"
# else
#     echo "Killing process $jarPid"
#     #kill -9 $jarPid
#     ps aux | grep logging-l4j2.jar | awk '{ print $2 }')
#     kill $jarPid
# fi

# Execute the jar
java -jar $filelocation >> /var/log/shawntest.log 2>&1 &

echo "Listing files in folder:"

ls
