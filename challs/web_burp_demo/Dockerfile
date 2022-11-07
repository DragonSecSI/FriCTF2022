FROM node:17.0.1-alpine3.14

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

ENV FLAG=frictf{d0nt_7rust_th3_cl13nt}

EXPOSE 8000

USER node

CMD ["npm", "start"]
