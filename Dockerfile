FROM postgres:15 as db
WORKDIR /app
COPY ./scripts/db/init.sh /docker-entrypoint-initdb.d
COPY ./scripts/db/sessions.sql ./scripts/db/sessions.sql