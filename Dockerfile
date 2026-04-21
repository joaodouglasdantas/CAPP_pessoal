FROM ruby:3.4.2

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client \
  libvips \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && rails server -b 0.0.0.0"]