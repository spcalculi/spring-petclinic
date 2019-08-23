
#!/usr/bin/env bash
export JAVA_HOME=/var/vcap/packages/jdk/jdk1.8.0_181
export PATH=$PATH:$JAVA_HOME/bin
ls -lR
./mvnw spring-boot: run
echo "Starting application on..."
ip a
count=5
while [ $count -ge 0 ]; do
    success=$(curl -s http://localhost:8080)
    if [ $? -eq 0 ]; then
        break
    fi
    sleep 1;
    let count-=1
done
if [ $success == 0 ]; then
    echo "Deployment completed:$scansuccess"
    exit 0
else
    echo "Deployment did not complete in 5 attempts, exiting"
    exit 1
fi