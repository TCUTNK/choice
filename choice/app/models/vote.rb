class Vote < ApplicationRecord
	belongs_to :dinner
	belongs_to :budget, optional: true
	belongs_to :user
end
