class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.integer :journey_id
      t.integer :guest_id

      t.timestamps
    end
  end
end
