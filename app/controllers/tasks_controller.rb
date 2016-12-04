class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_tasks, only: [:index, :create]

  # GET /tasks
  # GET /tasks.json
  def index
    @task = Task.new
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to action: "index", notice: 'Task was successfully created.' }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  private def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private def task_params
    params.require(:task).permit(:subject, :status, :estimate_hours)
  end

  # 表示用tasksを準備する
  private def set_tasks
    @waiting_tasks = Task.yet.order(created_at: :desc)
    @doing_tasks = Task.doing.order(created_at: :desc)
  end

end
