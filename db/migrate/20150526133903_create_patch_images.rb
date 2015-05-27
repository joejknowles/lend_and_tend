class CreatePatchImages < ActiveRecord::Migration
  def change
    create_table :patch_images do |t|

      t.timestamps null: false
    end
  end
end
