class Note < ApplicationRecord
  belongs_to :user

  include ActionView::RecordIdentifier

  after_create_commit { broadcast_prepend_to [user, :notes], target: "#{dom_id(user)}_notes" }

end
