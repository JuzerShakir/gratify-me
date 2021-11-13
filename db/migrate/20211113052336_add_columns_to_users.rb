class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :birth_date, :date
    add_column :users, :gender, :integer, default: :undisclosed
  end
end
