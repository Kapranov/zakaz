#!/usr/bin/env bash
PORT='8080'
IP='212.26.132.112'
RACK_ENV=development
RAILS_ENV=development
HOSTNAME='zakaz.inet.ua'

killall ruby
rm -f  Gemfile.lock
bundle
bundle exec rake log:clear
bundle exec rake tmp:clear
bundle exec rake tmp:cache:clear
bundle exec rake assets:clean
echo -en "\nStart Development Server:\n"
echo -en "\thttp://$IP:$PORT\n"
bundle exec thin start -p $PORT -a $IP -e $RAILS_ENV
