class TasksController < ApplicationController

	
	
	def index
		@tasks = current_user.tasks.all
	end

	def new
		if current_user.tasks.count <= 5 || current_user.premium?
		@task = Task.new
		else
			redirect_to braintree_new_path
				
		
		end

	end

	def create
		
			
		@task = current_user.tasks.new(task_params)
		
			if @task.save 
				redirect_to user_tasks_path(current_user)
			else
				render "new"
			end	
		
	end

	def show
		@task = current_user.tasks.find(params[:id])
	end

	def edit
		@task = Task.find(params[:id])

	end

	def update
		@task  = current_user.tasks.find(params[:id])
		if @task.update(task_params)
			redirect_to user_tasks_path(current_user)
		else
			render "edit"
		end
	end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy
			redirect_to user_tasks_path(current_user)
	end

	def search

		if params[:search].blank?
		@tasks = current_user.tasks.all
		else
		@tasks = current_user.tasks.search(params)
		end	
		
		
	end




	private


		

		def task_params
			params.require(:task).permit(:task, :remarks, :start_date, :end_date, :user_id, :status)
			
		end



end
