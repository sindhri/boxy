class CreateDeviceSpecificationProperties < ActiveRecord::Migration
  def change
    create_table :device_specification_properties do |t|
      t.string :name
      t.belongs_to :category
      t.timestamps
    end
  end
end
