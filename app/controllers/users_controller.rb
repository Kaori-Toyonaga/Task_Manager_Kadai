class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:show]
  skip_before_action :login_required
  before_action :set_user, only: [:show, :edit]

  def index
  end

  def show
    @user = User.find(params[:id])
    @tasks = Task.where(user_id: current_user.id).all
  end

  def new
    redirect_to user_path(current_user.id) if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = '登録しました'
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "編集しました！"
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user.find_by(task_id: @task.id)
      redirect_to tasks_path, alert: "不正なアクセスです。"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
