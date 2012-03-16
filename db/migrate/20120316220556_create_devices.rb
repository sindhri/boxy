class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.belongs_to :category
      t.timestamps
    end
  end
end
