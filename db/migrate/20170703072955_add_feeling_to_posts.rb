class AddFeelingToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :feeling, :string
  end
end
