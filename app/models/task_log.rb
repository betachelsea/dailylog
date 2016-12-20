class TaskLog < ActiveRecord::Base

  belongs_to :task
  after_save :start_task

  def start_task
    self.task.start!
  end

end
