class AddNotesFieldToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :notes, :text
  end
end
