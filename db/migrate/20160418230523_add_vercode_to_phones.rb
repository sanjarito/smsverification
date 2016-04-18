class AddVercodeToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :vercode, :integer
  end
end
