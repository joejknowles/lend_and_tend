class AddInUseColumnToPatches < ActiveRecord::Migration
  def change
    add_column :patches, :in_use, :boolean, :default => false
  end
end
