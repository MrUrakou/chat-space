class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :user_id, null: false, add_index: true
      t.integer :group_id, null: false

      t.timestamps
    end
  end
end
