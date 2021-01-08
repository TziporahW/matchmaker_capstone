class AddColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :girl_approval, :boolean, default: false
    add_column :matches, :boy_approval, :boolean, default: false
  end
end
