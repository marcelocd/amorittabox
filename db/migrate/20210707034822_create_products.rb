class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.integer :cost_cents
      t.decimal :discount_percentage, default: 0
      t.integer :arts_amount, default: 0

      t.timestamps
    end
  end
end
