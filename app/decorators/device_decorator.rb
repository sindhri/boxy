class DeviceDecorator < ApplicationDecorator
  decorates :device

  def groups
    @details ||= device.groups.map do |group|
      group_details = group.fields.map do |field_name|
        device.details.find_or_initialize_by_group_and_name(group.name, field_name)
      end

      group.fields = group_details
      group
    end

    @details
  end
end