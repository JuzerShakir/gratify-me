class Say < ApplicationRecord
  # Joining say model with users model with a has_many-belongs to relationship
  belongs_to :user

  # no blank quotes allowed
  validates :quote, presence: true
end
