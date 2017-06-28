class AddLatitudeAndLongitudeToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :latitude, :float
    add_column :prospects, :longitude, :float
  end
end
