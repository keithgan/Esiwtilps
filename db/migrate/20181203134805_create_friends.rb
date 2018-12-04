class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|

      t.integer :friends_with
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
