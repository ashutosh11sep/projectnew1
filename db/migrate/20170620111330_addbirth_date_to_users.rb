class AddbirthDateToUsers < ActiveRecord::Migration[5.1]
  def change
  	      add_column :users, :birth_date, :datetime
  	      add_column :users, :gender, :string

          
  end
end
