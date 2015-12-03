class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.text :desc
      t.decimal :price
      t.string :category

      t.timestamps null: false
    end
  end
end
