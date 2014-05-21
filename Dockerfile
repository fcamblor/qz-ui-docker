# DOCKER-VERSION 0.10.0
FROM        fcamblor/restx-docker:0.32

RUN         ssh -o StrictHostKeyChecking=no github.com || echo "Added github to known_hosts"
RUN         restx app grab https://github.com/fcamblor/qzui.git
RUN         cd ~/.restx/apps/qzui/srv && restx deps install

EXPOSE      8080
CMD         /usr/bin/java -cp "target/restx/classes:target/dependency/*" -Drestx.app.package=qzui -Drestx.mode=prod  qzui.AppServer
