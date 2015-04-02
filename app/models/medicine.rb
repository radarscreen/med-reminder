class Medicine < ActiveRecord::Base
	belongs_to :client

	def at
	end
end
