## Development

* Local DB using Postgres, [migrations](src/main/resources/db/changelog)
  * start locally with `docker-compose up -d db`
  
RUN docker-compose.yml file

Add PostgreSQL DB
port: 1234
user: user
password: pass


* Backend in Java/Spring in [src]
  * build with `./gradlew build`

http://localhost:8080/


* Frontend in Vue.js in [UI]
