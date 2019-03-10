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

  To start sidekiq

  bundle exec sidekiq


* TEST
=======
  Execute test: rspec 

