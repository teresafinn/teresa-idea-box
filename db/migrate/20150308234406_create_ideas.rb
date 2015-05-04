class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
