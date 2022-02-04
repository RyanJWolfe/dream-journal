.PHONY: all test
default: install run;

install:
	bundle install

run:
	bundle exec rails db:migrate RAILS_ENV=development
	bundle exec rails s

local:
	bundle exec rails db:migrate RAILS_ENV=development
	bin/dev

test:
	bundle exec rails db:migrate RAILS_ENV=test
	bundle exec rspec

lint:
	bundle exec bundler-audit --update
	bundle exec brakeman -q -w2
	bundle exec rubocop --parallel

deploy:
	bundle exec rails db:migrate RAILS_ENV=production
	bundle exec cap staging deploy
