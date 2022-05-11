class DeactivateJob < ApplicationJob
  queue_as :default

  def perform(offer)
    puts "I'm starting the fake job"
    sleep 3
    offer.inactive!
    #AdminMailer.with(user: offer.user).inactive.deliver_now
  end
end
