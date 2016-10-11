class AddAdditionalFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :link_karma, :integer
    add_column :users, :comment_karma, :integer
    add_column :users, :created_at, :datetime
  end
end
