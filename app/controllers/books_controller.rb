class BooksController < ApplicationController
	def index
		@book = Book.new
		@user = current_user
		@books = Book.all
	end

	def edit
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def show
	    @book = Book.find(params[:id])
        @book_new = Book.new
		@user = User.find(@book.user_id)
	end

    def update
    	@book = Book.find(params[:id])

       if @book.update(book_params)

    	  flash[:notice] = "You have updated book successfully."
    	  redirect_to book_path(@book)
       else
    	  @book_new = Book.new
    	  render:edit
       end
    end

	def destroy
     @book = Book.find(params[:id])
     @book.destroy
     redirect_to books_path
	end

	def create
		@books = Book.all
		@book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
        	flash[:notice] = "You have created book successfully."
    	    redirect_to book_path(@book)
    	else
    	 render :index
        end
	end

  def correct_edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end

 private
     def book_params
	  params.require(:book).permit(:title, :body)

     end

end
































































































































































































































































































































