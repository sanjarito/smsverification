class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :phones, :Vercode, :vercode
  end
end
