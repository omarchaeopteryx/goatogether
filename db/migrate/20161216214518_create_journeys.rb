class CreateJourneys < ActiveRecord::Migration[5.0]
  def change
    create_table :journeys do |t|
      t.integer :user_id
      t.string :hashtag
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
