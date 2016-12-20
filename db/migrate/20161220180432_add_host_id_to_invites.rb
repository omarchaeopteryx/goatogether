class AddHostIdToInvites < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :host_id, :integer
  end
end
