# web: bundle exec thin start -p $PORT -e $RACK_ENV &
web1: subcontract --rbenv . --chdir ../zakaz --signal INT -- bundle exec thin start -p 8080 -e $RACK_ENV &
web2: subcontract --rbenv . --chdir ../eshop --signal INT -- bundle exec thin start -p 8081 -e $RACK_ENV &
