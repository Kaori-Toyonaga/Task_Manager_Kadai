class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_labels, only: [:index]

  def index
    @tasks = current_user.tasks
    #user.rbでアソシエーション設定したhas_many :tasks, dependent: :destroyの「tasks」を利用
    @tasks = @tasks.search_title(params[:title_key]) if params[:title_key].present?
    @tasks = @tasks.search_status(params[:status]) if params[:status].present? && params[:status] != "未選択"
    @tasks = @tasks.search_label(params[:label_id]) if params[:label_id].present?
    # @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] }) if params[:label_id].present?

    @tasks = @tasks.order('expired_at DESC') if params[:sort_expired]
    @tasks = @tasks.order('priority DESC') if params[:sort_priority]
    @tasks = @tasks.order('created_at DESC')

    @tasks = @tasks.page(params[:page]).per(2)
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
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
    unless params[:task][:label_ids]
      @task.label_on_tasks.delete_all
    end

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
    params.require(:task).permit(:title, :detail, :expired_at, :status, :priority, :user_id, label_ids: [] )
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_labels
    @labels = Label.all
  end

  def sort_params
      params.permit(:sort)
  end
end
