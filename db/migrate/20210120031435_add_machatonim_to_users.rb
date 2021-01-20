class AddMachatonimToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :machatonim, :string
  end
end
