class UsersController < ApplicationController


    def create

    end

    def index
       @book = Book.new
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
        if @user.id == current_user.id
         render :edit
        else
         redirect_to user_path(current_user)
        end
    end

    def update
        @user = User.find(params[:id]) #プロフィール更新の記述
        if @user.update(user_params)
        flash[:notice] = 'You have updated user successfully.'
        redirect_to user_path(@user.id)
        else
        render :edit
        end
    end

    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end


end
