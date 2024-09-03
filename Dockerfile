FROM node:14-bullseye
WORKDIR cd 
COPY . .
RUN npm install && npm run build
EXPOSE 3000
CMD ["npm", "start"]