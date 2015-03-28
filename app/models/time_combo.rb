class TimeCombo < ActiveRecord::Base
	belongs_to :medicine, dependent: :destroy
end
