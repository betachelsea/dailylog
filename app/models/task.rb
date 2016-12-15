class Task < ActiveRecord::Base
  include AASM
  enum status: { yet: 0, doing: 1, done: 2 }
  aasm column: :status, enum: true do
    state :yet, initial: true
    state :doing
    state :done
  end

  validates :subject, presence: true
  has_many :task_logs
  belongs_to :user

  scope :by_user, ->(user) { where(user: user) }

end
