class VotesController < ApplicationController
	def new
		@vote_new=Vote.new
		@dinner = Dinner.find_by(slug:params[:dinner_slug])
	end
	def create
		@vote_new=Vote.new(vote_params)
		@dinner=Dinner.find_by(slug:params[:dinner_slug])
		@vote_new.user_id=current_user.id
		@vote_new.dinner_id=@dinner.id
		if @vote_new.save
			redirect_to history_path(@dinner)
		else
			render :new
		end
	end
	private
	def vote_params
		params.require(:vote).permit(
			:budget_ids,
			:attend,
			:vote_name,
			:vote_genre_name,
			:vote_area_name,
			:dinner_id,
			:user_id,
			:budget_id, null: true
			)
	end
end
