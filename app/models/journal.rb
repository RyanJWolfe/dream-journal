class Journal < ApplicationRecord
  has_many :dream_logs

  validates :title, presence: true
  validates :author, presence: true
end
