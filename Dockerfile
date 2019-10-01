#

# Build stage

#

FROM maven:3.6.0-jdk-11-slim AS build

COPY src ./spring-petclinic/src

COPY pom.xml ./spring-petclinic

RUN mvn -f ./spring-petclinic/pom.xml clean package



#

# Package stage

#
	
FROM openjdk:11-jre-slim

COPY --from=build ./spring-petclinic/target/*.jar /usr/local/lib/demo.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
