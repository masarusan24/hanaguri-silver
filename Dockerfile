FROM ruby:2.6.3
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir app

RUN gem install bundler -v 2.0.2

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
COPY . /app

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]