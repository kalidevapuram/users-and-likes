class SessionsController < ApplicationController
	def new

	end

	def create
	   user = User.find_by_email(params[:email])

	   puts "*********"
	   puts user

	   if user && user.authenticate(params[:password])
			session[:id] = user.id 
	        redirect_to "/users/#{user.id}"
	   else
	     flash[:errors] = ["Invalid user name and password"]
	     redirect_to '/sessions/new'
	   end

 	end

 	def destroy

		session[:id] = false

		redirect_to "/sessions/new"
	end

end
