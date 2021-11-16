class UsersController < ApplicationController
  def index
	 @book = Book.new
	 @user = current_user
	 @book_new = Book.new
  end

  def show
   @user = User.find(params[:id])
   @book_new = Book.new
  end

  def edit
   @user =  current_user
  end
  def update
   user = User.find(params[:id])
   user.updete(user_params)
   redirect_to user_path(current_user)
  	 
    if @user.save
     redirect_to user_path
    else
  	 render:edit
  	     
  	   
    end
   end
end