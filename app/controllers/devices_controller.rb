class DevicesController < ApplicationController
  def new
    @device   = Device.new(:category => params["category"])
    @groups   = DeviceInformation.groups(params["category"])
  end
  
  def create
    details = []
    
    params["details"].each do |group, fields|
      fields.each do |name, value|
        details << { :group => group, :name => name, :value => value }
      end
    end
    
    device = Device.create(params["device"].merge(:details_attributes => details, :room_id => params["room_id"]))
    redirect_to room_device_path(params["room_id"], device.id)
  end
  
  def show
    @device = Device.find(params["id"])
    @groups = DeviceInformation.groups(@device.category)
    @details = Hash.new { |h,k| h[k] = {} }
    
    @device.details.each do |d|
      @details[d.group][d.name] = d.value
    end
  end
end
