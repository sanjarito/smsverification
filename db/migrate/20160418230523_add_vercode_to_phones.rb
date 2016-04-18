class AddVercodeToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :Vercode, :integer
  end
end
