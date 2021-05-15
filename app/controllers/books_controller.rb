class BooksController < ApplicationController

    def new
    end

    def create
        @book = Book.new(book_params) #新規投稿用
        @book.user_id = current_user.id
        @book.save
        redirect_to book_path(@book.id)
    end

    def index
        @user = User.all #プロフィールを表示させるための記述
        #@book = Book.new #新規投稿を行う記述
        @books = Book.all #indexに全ての投稿を表示させるための記述
    end

    def show
        @user = User.find(params[:id])
        @book = Book.find(params[:id])
    end

    def edit
      # @user = User.find(params[:id]) #マイページuserで指定されていればbookで同じ記述を書かなくてよい？
    end

    def update
        @user = User.find(params[:id]) #プロフィール画像保存記述
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    def destroy
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

end
