class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
  			redirect_to root_path, 
  			notice: "welcome #{user.email}, you have succesfully have signed in"
  	else
  		render "new" , alert: "User Id And or Password Invalid"

  	end
  end

    # allows to user current_user within the  views
    

  		def destroy
    		session[:user_id] = nil
   			redirect_to root_path,
   			notice: "You succesfully logged out"
 		  end

  	
end
	