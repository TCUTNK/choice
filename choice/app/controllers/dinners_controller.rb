class DinnersController < ApplicationController
	def index
		@dinner_new = Dinner.new
		@dinner_new.areas.build
		@dinner_new.genres.build
		@histories=current_user.votes.limit(4).order("id DESC")
	end
	def create
		dinner_new=Dinner.new(dinner_params)
		dinner_new.user_id = current_user.id
		dinner_new.save
		redirect_to dinner_path(dinner_new)
	end
	def show
		@dinner = Dinner.find_by(slug:params[:slug])
	end
	private
	def dinner_params
		params.require(:dinner).permit(
			:dinner_name,
			:memo,
			:user_id,
			:make_time,
			:slug,
			areas_attributes: [:id, :area_name, :dinner_id, :_destroy],
			genres_attributes: [:id, :genre_name, :dinner_id, :_destroy]
			)
	end


end
