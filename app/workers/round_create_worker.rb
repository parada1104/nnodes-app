class RoundCreateWorker
  include Sidekiq::Worker

  def perform(*args)
    form = RoundForm.new
    form.persist!
  end
end
