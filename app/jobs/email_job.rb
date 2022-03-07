class EmailJob < ApplicationJob
  queue_as :default
  user = User.last
  user.to_global_id #=> #<GlobalID:0x000055988bc4dd20 [...] gid://background-jobs-demo/User/1>>
  user.to_global_id.to_s #=> "gid://background-jobs-demo/User/1"

  def perform(user_id, offer_id)
    # Do something later
    user = User.find(user_id)
    offer = Offer.find(offer_id)
    puts "I'm starting the fake job #{user.email}"
    UserMailer.with(user: user, offer: offer).welcome.deliver_now
    sleep 3
    puts "OK I'm done now"
  end
end
