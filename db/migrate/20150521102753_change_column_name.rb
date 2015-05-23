class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :patches, :size, :type
  end
end
