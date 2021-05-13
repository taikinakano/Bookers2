class UsersController < ApplicationController

    def new
    end

    def index
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
    end

    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image_)
    end


end
