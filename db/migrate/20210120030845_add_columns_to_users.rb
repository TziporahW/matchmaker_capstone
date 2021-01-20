class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :parents, :string
    add_column :users, :siblings, :text
    add_column :users, :shul, :string
    add_column :users, :summers, :string
    add_column :users, :height, :string
    add_column :users, :shadchan_info, :text
    add_column :users, :looking_for, :text
  end
end
