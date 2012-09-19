class DevicesController < ApplicationController
  before_filter :find_device,     :except => [:new, :create]
  before_filter :decorate_device, :except => [:create, :update, :new]

  def new
    @device = Device.new(:category => params["category"])
    decorate_device
  end

  def create
    device = Device.create(params[:device])
    redirect_to room_device_path(params["room_id"], device.id)
  end

  def update
    @device.update_attributes(params[:device])
    redirect_to room_device_path(params["room_id"], @device.id)
  end

  private

  def find_device
    @device = Device.find(params["id"])
  end

  def decorate_device
    @device = DeviceDecorator.new(@device)
  end

end
