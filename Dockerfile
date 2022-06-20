FROM node:16.15.1-buster-slim

WORKDIR /tmp/checkimage
COPY . /tmp/checkimage

RUN npm config set registry https://registry.npm.taobao.org npm info underscore \
&&  npm --registry https://registry.npm.taobao.org info underscore \
&&  npm i \
&&  npm i -g pm2 \
&&  npm cache clean --force

ENTRYPOINT ["pm2-runtime"]
CMD ["index.js", "--name", "checkimage"]

EXPOSE 3027