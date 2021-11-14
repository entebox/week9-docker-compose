FROM node:14-alpine
# add bash for debug
RUN apk add --no-cache bash
# Create app directory
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app
# Copy package.json and package-lock into container
COPY package*.json /usr/src/app/
# initialize npm
RUN npm init -y
# install all dependencies
RUN npm install; exit 0
RUN npm audit fix --force
# Copy entire app directory
COPY . /usr/src/app/
# expose port
EXPOSE 8080
#run the app
CMD npm run dev

