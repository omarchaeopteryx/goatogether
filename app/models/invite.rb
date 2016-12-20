class Invite < ApplicationRecord
  belongs_to :journey
  belongs_to :guest, {class_name: :User}
  belongs_to :host, class_name: :User
end
