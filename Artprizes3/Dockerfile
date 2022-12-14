#FROM nginx
#COPY ./nginx.conf /etc/nginx/conf.d/default.conf
#COPY build/web /usr/share/nginx/html
#RUN ["nginx"]
#EXPOSE 8080

#FROM nginx:alpine
#COPY build/web /usr/share/nginx/html

FROM debian:latest AS build-env

# Install flutter dependencies
RUN apt-get update 
RUN apt-get install -y curl git wget zip unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

# Clone the flutter repo
RUN git clone   https://github.com/flutter/flutter.git /usr/local/flutter

# Run flutter doctor and set path
RUN /usr/local/flutter/bin/flutter doctor -v
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Enable flutter web
RUN flutter channel master
#RUN flutter channel dev 
RUN flutter upgrade
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /usr/local/app
COPY . /usr/local/app
WORKDIR /usr/local/app
RUN /usr/local/flutter/bin/flutter pub get
RUN /usr/local/flutter/bin/flutter build web

# Stage 2 - Create the run-time image
FROM nginx
COPY --from=build-env /usr/local/app/build/web /usr/share/nginx/html
