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
		@book_new = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

    def update
    	book = Book.find(params[:id])
    	book.updete(book_params)
    	redirect_to　book_path
    	if @edit_book.save
    		flash[:notice] = "Book was successfully destroyed "
    		redirect_to edit_book_path
    		else
    			render:edit
    end
    end

	def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to book_path
	end

	def create
		@books = Book.all
		@book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
        	flash[:notice] = "Book was successfully destroyed."
    	    redirect_to book_path(@book)
    	else
    	 render :index
        end
	end

 private
     def book_params
	  params.require(:book).permit(:title, :body)

     end

end
































































































































































































































































































































