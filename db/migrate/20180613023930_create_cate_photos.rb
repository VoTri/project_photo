class CreateCatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :cate_photos do |t|
      t.references :category
      t.references :photo

      t.timestamps
    end
    add_index :cate_photos, [:category_id, :photo_id]
  end
end
