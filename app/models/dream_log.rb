class DreamLog < ApplicationRecord
  belongs_to :journal
  broadcasts_to :journal
end
