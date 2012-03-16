class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.text :value
      t.belongs_to :device
      t.belongs_to :property
      t.timestamps
    end
  end
end
