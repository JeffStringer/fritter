class AddNowToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :now, :string
  end
end
