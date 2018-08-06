class HistoriesController < ApplicationController
	def index
		@votes=current_user.votes.order("id DESC")
# SELECT "pages".* FROM "pages" ORDER BY category_id DESC
	end
	def show
		@dinner=Dinner.find_by(slug:params[:slug])
		@votes=@dinner.votes
		@area=@votes.group(:vote_area_name).count
		@genre=@votes.group(:vote_genre_name).count
		@attend_users=@votes.where(attend: true)
		@absent_users=@votes.where(attend: false)
		# @budgets=@votes.budget.group(:range)
	end
end