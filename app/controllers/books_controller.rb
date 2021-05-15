class BooksController < ApplicationController

    def new
    end

    def create
        @book = Book.new(book_params) #新規投稿用
        @book.user_id = current_user.id
        if @book.save
        redirect_to book_path(@book.id)
        else
        #@user = current_user
       # @book.user_id = current_user.id
        render :index
        end
    end

    def index
        @book = Book.new
        @user = current_user #ユーザーとviewを結びつける記述
        @books = Book.all #indexに全ての投稿を表示させるための記述
    end

    def show
        @book = Book.find(params[:id]) #投稿を表示させる記述
        @user = @book.user #部分テキストを表示させる記述
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        @book.update(book_params)
        redirect_to book_path(@book.id)
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
