DeviceInformation = Object.new

class << DeviceInformation
  Group = Struct.new(:name, :fields)
 
  def categories
    data.keys
  end

  def groups(category)
    data[category].map { |k,v| Group.new(k, v) }
  end
 
  private
 
  def data
    @data ||= YAML.load_file(Rails.root + "config/device_properties.yml")
  end
end