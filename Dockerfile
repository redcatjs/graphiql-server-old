FROM node:9

WORKDIR /app

RUN git clone https://gitlab.com/kachkaev/graphiql-workspace-app.git .

RUN npm install

RUN npm run build

RUN npm -g i serve

EXPOSE 5000

CMD serve -s build
