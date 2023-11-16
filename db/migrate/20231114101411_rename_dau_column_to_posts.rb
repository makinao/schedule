class RenameDauColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :dau, :day
  end
end
