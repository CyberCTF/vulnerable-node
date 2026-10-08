# NodeBazaar app image. Node 22 slim; deps copied first for layer caching.
# Upstream's Dockerfile (app/Dockerfile) with these changes: the source is copied from app/,
# package-lock.json is copied with package.json so npm installs the locked versions (upstream
# copies package.json alone), and the environment upstream's docker-compose.yml sets for the web
# service is baked in as ENV.
FROM node:22-slim

ENV DATABASE_URL=postgres://nodebazaar:nodebazaar@db:5432/nodebazaar \
    MONGO_URL=mongodb://mongo:27017/nodebazaar \
    IMDS_URL=http://imds:8090 \
    VAULT_URL=http://vault:8091 \
    SESSION_SECRET=nodebazaar-dev-secret-do-not-use-in-prod \
    JWT_SECRET=jwt-super-secret \
    DEBUG_ERRORS=1 \
    NODE_ENV=development

WORKDIR /app

COPY app/package.json app/package-lock.json ./
RUN npm install --omit=dev

COPY app/ .

EXPOSE 3000
CMD ["node", "server.js"]
