class AddAreaToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :area, :string
  end
end
