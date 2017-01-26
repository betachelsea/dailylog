class TaskLogsController < ApplicationController

  def create
    task_log = TaskLog.new(task_log_params)
    if task_log.start_task!
      redirect_to tasks_path, notice: 'Task log was successfully created.'
    else
      redirect_to tasks_path, error: 'failed create task_log.'
    end
  end

  private def task_log_params
    params.require(:task_log).permit(:task_id, :user_id)
  end

end
