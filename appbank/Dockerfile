FROM ruby:2.3

RUN mkdir /laboratorio4
WORKDIR /laboratorio4

ADD Gemfile /laboratorio4/Gemfile
ADD Gemfile.lock /laboratorio4/Gemfile.lock

RUN bundle install
ADD . /laboratorio4
