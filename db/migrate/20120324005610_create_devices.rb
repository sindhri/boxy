class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :category
      t.belongs_to :room
      t.timestamps
    end
  end
end
