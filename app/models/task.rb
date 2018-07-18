class Task < ApplicationRecord
	belongs_to :user
	enum status: [:incomplete, :complete]

	validates :task, presence: true
	validates :remarks, presence: true

	validate :start_date_cannot_be_in_the_past
	validate :end_date_cannot_be_in_the_past
	validate :end_date_cannot_be_before_start_date


  	def start_date_cannot_be_in_the_past
    	if start_date.present? && start_date <= Date.today
      		errors.add(:start_date, "can't be in the past")
    	end
  	end 

  	validate :end_date_cannot_be_in_the_past

  	def end_date_cannot_be_in_the_past
    	if end_date.present? && end_date <= Date.today
      		errors.add(:end_date, "can't be in the past")
    	end
  	end  
  	def end_date_cannot_be_before_start_date
    	if end_date.present? && end_date <= start_date
      		errors.add(:end_date, "can't be in the past")
    	end
  	end  

	def self.search(params)
		tasks = Task.where("task LIKE ? or remarks LIKE?", "%#{params[:search]}%","%#{params[:search]}%")
			if params[:search].present?
		tasks #shows all the tasks related to search		
		end
	end


end
