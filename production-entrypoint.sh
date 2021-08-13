#!/bin/sh
bundle exec rails assets:precompile --trace
foreman start
