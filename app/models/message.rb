class Message < ApplicationRecord
  validates :body, presence: true

  belongs_to :user
  belongs_to :group
  scope :asc, -> { order(created_at: :asc) }

  def created_time
    created_at.strftime("%Y年%m月%d日 %H時%M分")
  end
end
