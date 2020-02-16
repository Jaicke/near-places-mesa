FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem install rails -v '5.2.4'

ENV RAILS_ROOT /var/www/near_places
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

# Setting env up
ENV RAILS_ENV='production'
ENV RACK_ENV='production'

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install --jobs 20 --retry 5 --without development test

# Adding project files
COPY . .

CMD ["bundle", "exec", "rails", "server", "-e", "production"]
