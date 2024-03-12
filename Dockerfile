FROM node:18-alpine as base

FROM base as builder

WORKDIR /home/node
COPY package*.json ./

COPY . .
RUN npm install
RUN npm run build

FROM base as runtime

ENV NODE_ENV=production

WORKDIR /home/node
COPY package*.json  ./

RUN npm install --production
COPY --from=builder /home/node/dist ./dist
COPY --from=builder /home/node/build ./build
COPY --from=builder /home/node/.next ./.next
COPY --from=builder /home/node/.env ./

EXPOSE 3000

CMD ["node", "dist/server.js"]