class UrlsController < ApplicationController
	def index
		@dinner = Dinner.last
	end
end
