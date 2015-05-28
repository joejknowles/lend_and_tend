class CreatePatches < ActiveRecord::Migration
  def change
    create_table :patches do |t|

      t.timestamps null: false
    end
  end
end
