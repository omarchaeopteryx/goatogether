class Journey < ApplicationRecord
  belongs_to :user
  has_many :invites
  has_many :participants, source: :User
end
