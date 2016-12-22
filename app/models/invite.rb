class Invite < ApplicationRecord
  belongs_to :journey
  belongs_to :guest, {class_name: :User}

  scope :positive, -> { where(response:true) }
  scope :negative, -> { where(response:true) }
  scope :by, -> (user) { where(guest_id: user.id) }
end
