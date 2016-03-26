FROM ruby:latest

ENV HOME /home/app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR $HOME

ADD Gemfile* $HOME/
RUN bundle install

ADD . $HOME
