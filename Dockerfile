FROM node:9

ARG DEFAULT_URL=http://localhost:3000/graphql
ARG DEFAULT_WEBSOCKET_URL=ws://localhost:3000/subscriptions

ENV REACT_APP_GRAPHIQL_DEFAULT_URL=$DEFAULT_URL
ENV REACT_APP_GRAPHIQL_DEFAULT_WEBSOCKET_URL=$DEFAULT_WEBSOCKET_URL

WORKDIR /app

RUN git clone https://gitlab.com/kachkaev/graphiql-workspace-app.git .

RUN npm install graphiql-workspace@latest subscriptions-transport-ws@latest

COPY src/App.js src/App.js
COPY src/GraphiQLSubscriptionsFetcher.js src/GraphiQLSubscriptionsFetcher.js

RUN npm run build

RUN npm -g i serve

EXPOSE 5000

CMD serve -s build
