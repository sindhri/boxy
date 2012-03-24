class Room < ActiveRecord::Base
  has_many :devices
end
