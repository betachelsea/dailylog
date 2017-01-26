class TaskLog < ActiveRecord::Base

  belongs_to :task

  def start_task!
    self.started_at = Time.zone.now
    self.task.start!
    self.save!
  end

  def stop_task
    self.task.pause!
  end

  def finished?
    self.finished_at.present?
  end

end
