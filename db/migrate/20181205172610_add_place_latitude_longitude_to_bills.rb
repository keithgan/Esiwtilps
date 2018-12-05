class AddPlaceLatitudeLongitudeToBills < ActiveRecord::Migration[5.2]
  def change
    add_column :bills, :place, :string
    add_column :bills, :latitude, :decimal
    add_column :bills, :longitude, :decimal
  end
end
