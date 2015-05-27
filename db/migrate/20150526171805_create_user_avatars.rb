class CreateUserAvatars < ActiveRecord::Migration
  def change
    create_table :user_avatars do |t|

      t.timestamps null: false
    end
  end
end
