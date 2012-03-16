class CreateDeviceSpecificationCategories < ActiveRecord::Migration
  def change
    create_table :device_specification_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
