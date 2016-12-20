class Task < ActiveRecord::Base
  include AASM
  enum status: { yet: 0, doing: 1, done: 2, suspending: 3 }
  aasm column: :status, enum: true do
    state :yet, initial: true
    state :doing
    state :done
    state :suspending

    event :start, before: :stop_all_my_task do
      transitions from: :yet, to: :doing
      transitions from: :suspending, to: :doing
    end

    event :pause do
      transitions from: :doing, to: :suspending
    end
  end

  validates :subject, presence: true
  has_many :task_logs
  belongs_to :user

  scope :by_user, ->(user) { where(user: user) }
  scope :waiting, -> { where.not(status: statuses[:doing]) }

  # 同じユーザが持つタスクのdoingを無くす
  def stop_all_my_task
    tasks = Task.where(user: self.user).doing
    tasks.each {|task| task.pause! }
  end

end
