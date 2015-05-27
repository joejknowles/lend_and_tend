class AddPatchReferenceToPatchImages < ActiveRecord::Migration
  def change
    add_reference :patch_images, :patch, index: true, foreign_key: true
  end
end
