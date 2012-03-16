class DeviceSpecification::Category < ActiveRecord::Base
  has_many :properties
end
