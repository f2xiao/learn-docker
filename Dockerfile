FROM node:16.16.0
WORKDIR /app
EXPOSE 8080
COPY package.json /app
RUN npm install
COPY . /app
CMD ["npm","run","dev"] 