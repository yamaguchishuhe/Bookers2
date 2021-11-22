class UsersController < ApplicationController



  def index
	 @book = Book.new
	 @user = current_user
     @books = Book.all
     @users = User.all
  end

  def show
   @user = User.find(params[:id])
   @books = @user.books
   @book = Book.new
  end

  def edit
   @user = User.find(params[:id])

  end
  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
   redirect_to user_path(current_user.id)
   else
   flash.now[:alert] = ' error prohibited this obj from being saved:'
      render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end


  def ensure_current_user
    @user = User.find(params[:id])
    if @user.id != current_user
      redirect_to user_path(current_user)
    end
  end

end


