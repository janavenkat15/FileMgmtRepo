#define what image to build from
FROM node:18-alpine  as builder

ARG gitusername
ARG gitpassword

WORKDIR /app/

RUN apk add --no-cache git bash

RUN git config --global credential.helper '!f() { sleep 1; echo "username=x-access-token"; echo "password=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"; }; f'

COPY package*.json ./ 

RUN npm ci --production

FROM node:18-alpine

ARG APP_VERSION=1.0.0.0

ARG APP_MODEL_NUMBER=12345

ARG APP_MANUFACTURE_DATE=10-11-2020

ENV APP_VERSION ${APP_VERSION}

ENV APP_MODEL_NUMBER ${APP_MODEL_NUMBER}

ENV APP_MANUFACTURE_DATE ${APP_MANUFACTURE_DATE}

WORKDIR /app/ 

COPY --from=builder /app .

COPY . /app

EXPOSE 4001

CMD [ "node","index.js" ]
