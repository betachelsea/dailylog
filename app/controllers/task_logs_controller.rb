class TaskLogsController < ApplicationController

  def create
    @task_log = TaskLog.new(task_log_params)
    @task_log.started_at = Time.zone.now
    if @task_log.save
      redirect_to tasks_path, notice: 'Task log was successfully created.'
    else
      render 'tasks/new'
    end
  end

  private def task_log_params
    params.require(:task_log).permit(:task_id)
  end

end
