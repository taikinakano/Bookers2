class BooksController < ApplicationController

    def new
    end

    def create
        @book = Book.new(post_image_params)
        @book.user_id = current_user.id
        @book.save
        redirect_to date_path
    end

    def index
        @book = Book.new
    end

    def show
        @book = Book.find(params[:id])
    end

    def edit
    end

    def update
    end

    def destroy
    end
    
    private
    def book_params
        params.require(:post_image).permit(:title, :body)
    end

end
