class AddDescriptionToPatches < ActiveRecord::Migration
  def change
    add_column :patches, :description, :string
  end
end
