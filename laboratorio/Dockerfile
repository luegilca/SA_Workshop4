FROM ruby:2.3

RUN mkdir /laboratorio
WORKDIR /laboratorio

ADD Gemfile /laboratorio/Gemfile
ADD Gemfile.lock /laboratorio/Gemfile.lock

RUN bundle install
ADD . /laboratorio
