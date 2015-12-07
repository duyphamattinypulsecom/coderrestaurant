class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.string :comment
      t.references :food, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
