class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def show
    @user=User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  
  end

  def edit
    @user=User.find(params[:id])
  end

  def index 
    @users=User.all
    @book=Book.new
    @user=current_user
  end


  def update
        @user = User.find(params[:id])
        @users=User.all
        if @user.update(user_params)
        redirect_to user_path(@user)
        flash[:success] = "User was successfully updated."
        else
        render :edit
        end
    end

  private
  def user_params
    params.require(:user).permit(:username, :profile_image,:introduction)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to users_path
    end
  end
end                               