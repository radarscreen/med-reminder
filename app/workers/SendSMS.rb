require 'twilio-ruby'
class SendSMS
	include Sidekiq::Worker

	def perform(medicine_id)
		schedule = Medicine.find(medicine_id)
		@twilio = Twilio::REST::Client.new "AC15733391cf17ec418750ae69ca38c7c5", "770ad0079eef71bfb69cb1d9a87f8c73" #hardcode values in from clients controller?

		@twilio.account.messages.create(
				from: '+12089364709',
				to: schedule.client.phone_number,
				body: 'IMPORTANT Medication Reminder ' + 'from ' + schedule.client.user.name + ': ' + schedule.client.name + ' needs to take ' + schedule.quantity + ' of ' + schedule.name + ' now.'
			)
	end

end
