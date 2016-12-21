class AddNameToJourney < ActiveRecord::Migration[5.0]
  def change
    add_column :journeys, :name, :string
  end
end
