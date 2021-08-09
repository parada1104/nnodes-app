#!/bin/sh
echo "what to test"
read TEST
TEST_ALL="docker compose run --rm -e RAILS_ENV=test web bundle exec rspec"
TEST_ESPECIFIC="$TEST_ALL $TEST"

[ -z "$TEST" ] && $TEST_ESPECIFIC  || $TEST_ALL