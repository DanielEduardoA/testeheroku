# https://spring.io/guides/gs/spring-boot-docker/
FROM adoptopenjdk/openjdk11:ubi
VOLUME /tmp

ARG DEPENDENCY_CLASS=target/dependency
COPY ${DEPENDENCY_CLASS}/BOOT-INF/lib        /app/lib
COPY ${DEPENDENCY_CLASS}/META-INF            /app/META-INF
COPY ${DEPENDENCY_CLASS}/BOOT-INF/classes    /app

CMD ["java","-Dspring.profiles.active=${SPRING_PROFILE}","-cp","app:app/lib/*","br.edu.univas.api.marvel.Application"]