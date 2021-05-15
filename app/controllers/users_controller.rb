class UsersController < ApplicationController

    def new
    end

    def create

    end

    def index
       @user = current_user
       @users = User.all
    end

    def show
        @book = Book.new #投稿の記述
        @user = User.find(params[:id]) #プロフィールを表示させる記述
        @books = @user.books.page(params[:page]).reverse_order #user_idと関連付けられた投稿を表示する記述
    end

    def edit
        @user = User.find(params[:id]) #プロフィールの編集
    end

    def update
        @user = User.find(params[:id]) #プロフィール更新の記述
        @user.update(user_params)
        redirect_to user_path(@user.id)
    end

    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end


end
