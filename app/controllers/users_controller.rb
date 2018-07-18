class UsersController < ApplicationController
	
	def index
		if current_user.admin?
		@users = User.all
		end
	end


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save
				redirect_to root_path
				session[:user_id] = @user.id
			else
				render "new"
			end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
			redirect_to users_path
	end

	private

		def user_params
			params.require(:user).permit(:email, :password)
		end
	

end
