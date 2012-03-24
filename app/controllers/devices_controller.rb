class DevicesController < ApplicationController
  
  before_filter :find_device,     :except => [:new, :create]
  before_filter :expand_details,  :only => [:show, :edit]
  before_filter :flatten_details, :only => [:create, :update]
  
  def new
    @device   = Device.new(:category => params["category"])    
    @groups   = DeviceInformation.groups(params["category"])
  end
  
  def create
    device = Device.create(device_params)
    redirect_to room_device_path(params["room_id"], device.id)
  end
  
  def update  
    @device.update_attributes(device_params)
    redirect_to room_device_path(params["room_id"], @device.id)
  end
  
  private
  
  def find_device
    @device = Device.find(params["id"])
  end
  
  def expand_details
    @groups = DeviceInformation.groups(@device.category)
    
    @details = Hash.new { |h,k| h[k] = {} }
    
    @device.details.each do |d|
      @details[d.group][d.name] = d.value
    end
  end
  
  def flatten_details
    @details = []
    
    params["details"].each do |group, fields|
      fields.each do |name, value|
        @details << { :group => group, :name => name, :value => value }
      end
    end
  end
  
  def device_params
    params["device"].merge(:details_attributes => @details, :room_id => params["room_id"])
 end
  
end
