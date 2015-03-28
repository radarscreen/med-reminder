class Medicine < ActiveRecord::Base
	belongs_to :client
	has_many :time_combos
end
