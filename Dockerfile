ruby iFROM ruby:2.7.4

RUN apt-get update && \
  apt-get install -y \
  postgresql-client \
  build-essential \
  libpq-dev \
  libxml2-dev \
  libxslt1-dev \
  nodejs \
  npm \
  libffi-dev \
  libreadline-dev \
  file \
  imagemagick \
  git \
  tzdata \
  libgmp-dev

WORKDIR /app
COPY . /app/

RUN gem install nokogiri --platform=ruby -- --use-system-libraries
RUN npm install
RUN bundle install

RUN echo 'Hello World'

ENTRYPOINT [ "bin/rails" ]
EXPOSE 3000
CMD ["s", "-b", "0.0.0.0"]




