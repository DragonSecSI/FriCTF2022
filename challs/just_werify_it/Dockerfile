FROM node:17.0.1-alpine3.14 AS production

WORKDIR /app

COPY ./package*.json .

RUN npm install

COPY ./* .

ENV FLAG=frictf{m4b3y_d0_n0t_exp0se_th3_s0urc3_c0d3}
ENV ENV_PASSWORD=super_secret_password_that_is_not_pushed_to_github_1337

RUN echo "PASSWORD=${ENV_PASSWORD}" >> .env

EXPOSE 8000

USER node

CMD ["npm", "start"]
