class UsersController < ApplicationController
  # skip_before_action :login_required, only: [:new, :create]

  # def index
  # end
  #
  def show
    @user = User.find(params[:id])
  #   @tasks = Task.where(user_id: current_user.id).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
  #     redirect_to new_session_path(@user.id)
  #     session[:user_id] = @user.id
    else
      render :new
    end
  end
  #
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end