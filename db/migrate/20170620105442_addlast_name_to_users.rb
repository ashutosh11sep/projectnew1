class AddlastNameToUsers < ActiveRecord::Migration[5.1]
  def change
     add_column :users, :last_name, :string
     add_column :userd, :birth_date, :datetime

 end
end
