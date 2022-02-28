class Journal < ApplicationRecord
  has_many :dream_logs, dependent: :delete_all

  validates :title, presence: true
  validates :author, presence: true
end
