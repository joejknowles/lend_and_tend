class AddLatitudeLongitudeColumnsToPatches < ActiveRecord::Migration
  def change
    add_column :patches, :latitude, :float
    add_column :patches, :longitude, :float
  end
end
