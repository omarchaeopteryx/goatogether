class CreateJourneys < ActiveRecord::Migration[5.0]
  def change
    create_table :journeys do |t|

      t.timestamps
    end
  end
end
