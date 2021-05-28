class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.page(params[:page]).per(20)
    if params[:title_key] && params[:status] != "未選択"
      @tasks = Task.search_title_status(params[:title_key], params[:status]).page(params[:page]).per(20)
      # @tasks = Task.where('title LIKE ?', "%#{params[:title_key]}%").where(status: params[:status])
    elsif params[:title_key] && params[:status] == "未選択"
      @tasks = Task.search_title(params[:title_key]).search_status(params[:status]).page(params[:page]).per(20)
      # @tasks = Task.search_title(params[:title_key]).search_status(status: [2..4])
      # @tasks = Task.where('title LIKE ?', "%#{params[:title_key]}%").where(status: [2..4])
    # elsif params[:status] == "未選択"
    #   @tasks = Task.search_status_2_4
    # elsif params[:status] != "未選択"
    #   @tasks = Task.search_status(params[:status])
    elsif params[:sort_expired]
      @tasks = Task.all.order('expired_at DESC').page(params[:page]).per(20)
    elsif params[:sort_priority]
      @tasks = Task.all.order('priority DESC').page(params[:page]).per(20)
    else
      @tasks = Task.all.order('created_at DESC').page(params[:page]).per(20)
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if params[:back]
      render :new
    else
      if @task.save
        redirect_to tasks_path, notice: "タスクを作成しました。"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
       redirect_to tasks_path, notice: "更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"削除しました。"
  end

  private
  def task_params
    params.require(:task).permit(:title, :detail, :expired_at, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def sort_params
      params.permit(:sort)
  end
end
