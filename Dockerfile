FROM ruby:3.0.0-alpine as dev-build

RUN apk add --update --virtual \
    runtime-deps \
    postgresql-client \
    build-base \
    libxml2-dev \
    libxslt-dev  \
    nodejs \
    yarn \
    libffi-dev \
    readline \
    build-base \
    postgresql-dev \
    libc-dev \
    linux-headers \
    readline-dev \
    file \
    imagemagick \
    git \
    tzdata \
    && rm -rf /var/cache/apk/*

WORKDIR /myapp
COPY . /myapp/
COPY /Gemfile /Gemfile
COPY /Gemfile.lock /Gemfile.lock
COPY /package.json /package.json

RUN gem install foreman
ENV BUNDLE_PATH /gems
RUN yarn install
RUN bundle install

CMD ["foreman", "start", "-f", "Procfile.dev"]
EXPOSE 5000

FROM ruby:3.0.0-alpine as prod-build
RUN apk add --update --virtual \
    runtime-deps \
    postgresql-client \
    build-base \
    libxml2-dev \
    libxslt-dev  \
    nodejs \
    yarn \
    libffi-dev \
    readline \
    postgresql-dev \
    libc-dev \
    linux-headers \
    readline-dev \
    file \
    git \
    tzdata \
    python2 \
    vim \
    && rm -rf /var/cache/apk/*
# Set working directory, where the commands will be ran:
WORKDIR /myapp
COPY . . 
RUN gem install foreman
RUN yarn install --production
RUN bundle install --jobs 20 --retry 5 --without development test
ENTRYPOINT [ "./docker-entrypoint.sh" ]
RUN chmod +x ./docker-entrypoint.sh
EXPOSE 5000

CMD ["foreman", "start", "-f", "Procfile"]