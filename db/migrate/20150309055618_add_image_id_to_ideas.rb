class AddImageIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :image_id, :integer
  end
end
