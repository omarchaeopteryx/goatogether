class AddResponseToInvite < ActiveRecord::Migration[5.0]
  def change
    add_column :invites, :response, :boolean
  end
end
