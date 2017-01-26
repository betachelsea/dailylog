class Task < ActiveRecord::Base
  include AASM
  enum status: { yet: 0, doing: 1, done: 2, suspending: 3 }
  aasm column: :status, enum: true do
    state :yet, initial: true
    state :doing
    state :done
    state :suspending

    event :start, before: :before_start do
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

  def start_task!(user)
    log = TaskLog.new(task_id: self.id, user_id: user.id)
    log.start_task!

  end

  # @return [Task] 対象者が持つdoingタスク
  def self.doing_of(user)
    Task.doing.find_by(user: user)
  end

  private def before_start
    # 同じユーザが持つタスクのdoingを無くす
    tasks = Task.where(user: self.user).doing
    tasks.each {|task| task.pause! }
  end

end
