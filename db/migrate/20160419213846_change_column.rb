class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :phones, :vercode, :string
  end
end
