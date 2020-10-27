FROM ruby:2.7.2
ENV LANG C.UTF-8

RUN apt update -qq && apt install -y mariadb-client

WORKDIR /marchen
COPY Gemfile /marchen/Gemfile
COPY Gemfile.lock /marchen/Gemfile.lock
RUN bundle install
COPY . /marchen

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
