#!/bin/sh
bundle exec rails assets:precompile --trace
bin/rails db:create db:schema:load
foreman start