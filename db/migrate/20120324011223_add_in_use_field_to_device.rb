class AddInUseFieldToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :in_use, :boolean, :default => true
  end
end
