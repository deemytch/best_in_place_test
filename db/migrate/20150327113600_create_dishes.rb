class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :code
      t.text   :descr
      t.float  :price
      t.boolean :available
      t.references :cuisine

      t.timestamps null: false
    end
    add_foreign_key :dishes, :cuisines
  end
end
