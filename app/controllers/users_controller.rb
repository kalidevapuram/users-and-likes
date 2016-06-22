class UsersController < ApplicationController


  def new
  end

  def show
     @user = User.find_by_id(params[:id])
    puts @user
  end

   def create

		@user = User.new user_params
	   if @user.save
	     redirect_to "/users/#{@user.id}"
	   else
	     flash[:error] = @user.errors.full_messages
	     redirect_to "/users/new"
		end
   end

   def edit
		@user = User.find_by_id(params[:id])
		
	end
	def update
		 @user = User.find(params[:id])
	    if @user.update(user_params)
	      flash[:success] = "User successfully updated"
	      redirect_to "/users/#{@user.id}"
	    else
	      flash[:errors] = @user.errors.full_messages
	      redirect_to '/users/update'
	    end
	end
	def destroy
		@user = User.find(params[:id]).destroy
		session.clear
		redirect_to '/sessions/new'
	end

	private

	def user_params
		params[:user].delete(:password) if params[:user][:password].blank?
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
  

  
end