# FROM node:latest

# RUN apt-get update && apt-get install xsel

# WORKDIR /app

# COPY ./ /app

# RUN chmod +x /app/run.sh && yarn install

# EXPOSE 3000

# ENTRYPOINT ["/app/run.sh"]


FROM node:latest as build-stage

WORKDIR /app

COPY ./target /app/

COPY ./nginx.conf /app/

EXPOSE 3000

# NGINX
# FROM nginx

# COPY --from=build-stage /app /usr/share/nginx/html

# COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf



FROM nginx
COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]