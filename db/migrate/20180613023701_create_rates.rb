class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float :rate_count
      t.references :photo
      t.references :user

      t.timestamps
    end
  end
end
