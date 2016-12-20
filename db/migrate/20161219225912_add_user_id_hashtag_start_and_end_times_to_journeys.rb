class AddUserIdHashtagStartAndEndTimesToJourneys < ActiveRecord::Migration[5.0]
  def change
    add_column :journeys, :user_id, :integer
    add_column :journeys, :hashtag, :string
    add_column :journeys, :start_time, :datetime
    add_column :journeys, :end_time, :datetime
  end
end
