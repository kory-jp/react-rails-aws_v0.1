FROM ruby:3.0.0 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn
RUN mkdir /react-rails-aws_v0.1
WORKDIR /react-rails-aws_v0.1
COPY Gemfile /react-rails-aws_v0.1/Gemfile
COPY Gemfile.lock /react-rails-aws_v0.1/Gemfile.lock
RUN bundle install
COPY . /react-rails-aws_v0.1

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

CMD ["rails", "server", "-b", "0.0.0.0"]