INSTALLATION
============

* Requirements
==============

  This project requires ruby 2.5.1

  - Sidekiq Server Installed

* Installation steps
====================

  Copy and configure yml.example files to their respective .yml ones and configure them

  config/database.yml.example

  Execute:

    bundle install
    bundle exec rake db:create
    bundle exec rake db:migrate db:test:prepare
    bundle exec rake db:seed   (yes to all)

* Sidekiq
=========

  To start sidekiq local

  bundle exec sidekiq


* TEST
=======
  Execute test: rspec 


* DEPLOY HEROKU
===============

git push heroku master

heroku run rake db:migrate:status

heroku run rake db:migrate

heroku restart

* ENDPOINT
==========

To simulate one of our third party data providers we have created two endpoints to get the necessary information:

- GET List of Companies: https://apinn.herokuapp.com/api/v1/companies
- GET Company info by ID: https://apinn.herokuapp.com/api/v1/companies/{companyId}
