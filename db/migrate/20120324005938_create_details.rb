class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.string :group
      t.string :name
      t.text   :value
      t.belongs_to :device
      t.timestamps
    end
  end
end
