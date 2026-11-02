# Vamos usar uma imagem base do node:latest
FROM node:20.10.0-alpine3.18
# Não vamos usar o multi-stage build, porque vamos usar o node:latest, essa é uma linguagem interpretada,
# portanto não precisa de build antes

WORKDIR /app

COPY src/package*.json .

RUN npm install

COPY src/ .

EXPOSE 8080

# Usuário sem privilégios que já vem na imagem oficial do Node.
# Fica depois dos COPY/RUN: os arquivos continuam do root e a aplicação só consegue lê-los.
USER node

CMD ["node","server.js"]
