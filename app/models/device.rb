class Device < ActiveRecord::Base
  has_many :details
  accepts_nested_attributes_for :details, :allow_destroy => true

  belongs_to :room

  def groups
    @groups ||= DeviceInformation.groups(self.category)
  end
end
