class Device < ActiveRecord::Base
  belongs_to :category, :class_name => "DeviceSpecification::Category"
end
