#!/bin/sh
echo "controller to create"
read CONTROLLER
COMMAND="docker compose run --rm web bin/rails g controller $CONTROLLER"

[ -z "$controller" ] && $COMMAND  || echo "you must provide a controller"