FROM ruby:2.7.4-alpine

RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  postgresql-dev \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  libffi-dev \
  readline \
  file \
  imagemagick \
  git \
  tzdata

WORKDIR /app
COPY . /app/

ENV BUNDLE_PATH /gems
RUN bundle install
RUN yarn install

ENTRYPOINT [ "bin/rails" ]
EXPOSE 3000
CMD ["s", "-b", "0.0.0.0"]




