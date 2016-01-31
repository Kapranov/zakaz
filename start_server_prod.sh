#!/usr/bin/env bash
PORT='80'
IP='212.26.132.112'
HOSTNAME='zakaz.inet.ua'

# README PRODUCTION
# bundle exec rails server -e production
# bundle exec rails console production
# RAILS_ENV=production bundle exec rails c

service nginx stop
ps aux | grep 'unicorn' | awk '{print $2}' | xargs kill -9
killall ruby
rm -rf .bundle
rm -rf tmp/cache/
rm -rf vendor/bundle/
rm -rf public/assets/
rm -f  Gemfile.lock
rm -f  zakaz_schemas.pdf
rm -f  zakaz_schemas.jpg
bundle
bundle exec rake tmp:clear
bundle exec rake log:clear
bundle exec rake tmp:cache:clear
bundle exec rake assets:clean
bundle install --deployment --without development test
bundle exec rake assets:precompile RAILS_ENV=production
touch /var/www/zakaz/tmp/restart.txt
bundle exec erd --title='zakaz.inte.ua model diagram' --filename='zakaz_diagram'
convert zakaz_diagram.pdf zakaz_diagram.jpg
echo -en "\n"
echo -en "\nStart Zakaz Production Server:\n"
echo -en "\thttps://$HOSTNAME\n"
echo -en "\n"
mailcatcher --http-ip $HOSTNAME
echo -en "\n"
service nginx start
/etc/init.d/unicorn_zakaz start
