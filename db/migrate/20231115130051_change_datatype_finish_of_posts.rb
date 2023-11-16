class ChangeDatatypeFinishOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :finish, :datetime
  end
end
