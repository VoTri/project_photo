class AddParentIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :parent_id, :integer
  end
end
