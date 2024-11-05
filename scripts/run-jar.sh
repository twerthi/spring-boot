# Get where the file was placed
filelocation=$(get_octopusvariable "Octopus.Action[Deploy Java Archive].Output.Octopus.Action.Package.InstallationPackagePath")

echo "Octopus placed the deployed .jar here: $filelocation"

# Execute the jar
java -jar $filelocation >> /var/log/shawntest.log 2>&1 &