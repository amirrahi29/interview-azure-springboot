FROM eclipse-temurin:17
EXPOSE 8082
ADD build/libs/Rahi-App-0.0.1-SNAPSHOT.jar Rahi-App-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/Rahi-App-0.0.1-SNAPSHOT.jar"]