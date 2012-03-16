class Detail < ActiveRecord::Base
  belongs_to :device
  belongs_to :property, :class_name => "DeviceSpecification::Property"
end
