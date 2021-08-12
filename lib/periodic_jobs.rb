PERIODIC_JOBS = {
  mgr.register "* 0 * * *", "AnaylyzeWeatherWorker", retry: 5
  mgr.register "* 23 * * *", "AnaylyzeWeatherWorker", retry: 5
}
