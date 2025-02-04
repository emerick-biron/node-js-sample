FROM node:23-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN addgroup -S app && \
    adduser -S app -G app && \
    chown -R app:app /app

USER app

EXPOSE 8080

CMD ["npm", "start"]
