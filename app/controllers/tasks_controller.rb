class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def index
    @tasks = Task.all
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

  private
  def task_params
    params.require(:task).permit(:title, :detail)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
