class SiteController < ApplicationController

	def login
		@users = User.new
	end

	def about
	end

end