class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :fweet
      t.belongs_to :user
      t.timestamps
    end
  end
end
