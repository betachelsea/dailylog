class Task < ActiveRecord::Base
  enum status: { yet: 0, doing: 1, done: 2 }

  has_many :task_logs
end
