class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :start
      t.string :finish
      t.boolean :dau
      t.string :memo

      t.timestamps
    end
  end
end
