class UsersController < ApplicationController
	def index
		@book = Book.new
		@user = current_user
  end
  
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	 @user =  current_user
  end
  def update
  	 redirect_to user_path(current_user)
  end
end