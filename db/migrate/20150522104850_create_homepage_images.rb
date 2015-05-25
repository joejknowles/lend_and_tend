class CreateHomepageImages < ActiveRecord::Migration
  def change
    create_table :homepage_images do |t|

      t.timestamps null: false
    end
  end
end
