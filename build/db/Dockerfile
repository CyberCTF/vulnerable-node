# The db service of upstream's docker-compose.yml: postgres:16-alpine with its environment baked
# in. The app creates and seeds its schema at start (app/db/init.js).
FROM postgres:16-alpine
ENV POSTGRES_USER=nodebazaar \
    POSTGRES_PASSWORD=nodebazaar \
    POSTGRES_DB=nodebazaar
