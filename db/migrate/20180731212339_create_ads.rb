class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :price

      t.timestamps
    end
  end
end
