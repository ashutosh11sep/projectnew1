class AddPostIdToEndorsements < ActiveRecord::Migration[5.1]
  def change
    add_column :endorsements, :post_id, :integer
  end
end
