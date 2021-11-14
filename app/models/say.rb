class Say < ApplicationRecord
  belongs_to :user

  validates :quote, presence: true
end
