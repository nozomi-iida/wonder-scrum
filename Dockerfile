FROM ruby:2.5
ENV LANG C.UTF-8
#「-qqオプション」はエラー以外何も吐かないことを意味する。
#「-y」オプションは全部yesで実行することを意味する。
RUN apt-get update -qq &&  \
    apt-get install -y  \ 
    build-essential \ 
    libpq-dev \ 
    nodejs 

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install
COPY . /app