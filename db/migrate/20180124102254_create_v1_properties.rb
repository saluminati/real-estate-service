class CreateV1Properties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.string :title, null: false, default: "", limit: 50
      t.text :description, null: false
      t.string :street_address, null: false, default: "", limit: 200
      t.string :state, null: false, default: "", limit: 100
      t.string :post_code, null: false, default: "", limit: 4
      t.timestamps
    end
  end
end
