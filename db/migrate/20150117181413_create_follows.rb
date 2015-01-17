class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.belongs_to :user
      t.integer :follower_id
      t.timestamps
    end
  end
end
