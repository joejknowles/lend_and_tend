class UpdatePatchTypeColumnName < ActiveRecord::Migration
  def change
    rename_column :patches, :type, :patch_type
  end
end
