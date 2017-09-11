class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :text
      t.string :image
      t.integer :group_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
