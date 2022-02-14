FROM node:15
WORKDIR /app
COPY package.json ./

ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        npm install -g nodemon; \
        else npm install --only=production; \  
        fi


# RUN npm install
COPY . .

EXPOSE 3000
CMD ["nodemon", "index.js"]