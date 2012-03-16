class Device < ActiveRecord::Base
  belongs_to :category, :class_name => "DeviceSpecification::Category"
  has_many :details
end
