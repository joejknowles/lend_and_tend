class AddColumnsToPatch < ActiveRecord::Migration
  def change
    add_column :patches, :location, :string
    add_column :patches, :size, :string
    add_column :patches, :duration, :string
  end
end
