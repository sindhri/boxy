class DevicesController < ApplicationController
  before_filter :find_device
  
  def show
    @category = @device.category.name
    @details = @device.details.map {|e|[e.property.name, e.value]}
  end
  
  private
  
  def find_device
    @device = Device.find(params[:id])
  end
end
