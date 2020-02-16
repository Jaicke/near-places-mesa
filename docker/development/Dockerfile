FROM ruby:2.6

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install rails -v '5.2.4'

WORKDIR /near_places
ADD Gemfile Gemfile.lock /near_places/
RUN bundle install
