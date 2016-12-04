class Task < ActiveRecord::Base
  include AASM
  enum status: { yet: 0, doing: 1, done: 2 }

  has_many :task_logs

  aasm column: :status, enum: true do
    state :yet, initial: true
    state :doing
    state :done
  end

end
