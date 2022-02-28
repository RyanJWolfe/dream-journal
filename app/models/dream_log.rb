class DreamLog < ApplicationRecord
  belongs_to :journal
  broadcasts_to :journal

  def start_time
    created_at.to_date
  end
end
