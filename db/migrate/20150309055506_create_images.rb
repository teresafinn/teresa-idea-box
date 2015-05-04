class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :name
      t.text :url

      t.timestamps null: false
    end
  end
end
