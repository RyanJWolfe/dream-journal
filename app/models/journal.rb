class Journal < ApplicationRecord
  has_many :dream_logs, dependent: :delete_all

  validates :title, presence: true
  validates :author, presence: true

  def auth(current_user)
    current_user && current_user.id == @journal.user_id
  end
end
