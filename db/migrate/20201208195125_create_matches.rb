class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :girl_id
      t.integer :boy_id

      t.timestamps
    end
  end
end
