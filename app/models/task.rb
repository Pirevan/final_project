class Task < ApplicationRecord
	belongs_to :user
	enum status: [:incomplete, :complete]

	def self.search(params)
		tasks = Task.where("task LIKE ? or remarks LIKE?", "%#{params[:search]}%","%#{params[:search]}%")
			if params[:search].present?
		tasks #shows all the tasks related to search		
		end
	end
end
