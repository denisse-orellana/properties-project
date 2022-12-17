class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    # city query
    address = '%'
    address = params[:search_address] if !params[:search_address].nil?

    # room_number query
    # room_number = '%'
    room_number_input = params[:search_room_number] if !params[:search_room_number].nil? && params[:search_room_number] != ''

    # bathroom_number query
    # bathroom_number  = '%'
    bathroom_number_input = params[:search_bathroom_number] if !params[:search_bathroom_number].nil?

    @properties = Property
      .by_address(address)
      # .by_room_number(room_number_input)
      # .by_bathroom_number(bathroom_number_input)
      .with_attached_images
      .paginate(:page => params[:page], :per_page => 12) 
  end

  def show   
  end

  def new
      @property = Property.new
  end

  def edit
  end

  def create
      @property = Property.new(property_params)
      @property.user_id = current_user.id
      respond_to do |format|
        if @property.save
          format.html { redirect_to property_path(@property.id), notice: 'Property added' }
        else
          format.html { render :new }
        end
      end
  end

  def update
      respond_to do |format|
          if @property.update(property_params)
            format.html { redirect_to properties_path, notice: 'Property updated' }
          else
            format.html { render :edit }
          end
      end
  end

  def destroy
      respond_to do |format|
          if @property.destroy
            format.html { redirect_to properties_path, notice: 'Property deleted' }
          else
            format.html { redirect_to properties_path, notice: 'Property could not be deleted' }
          end
      end
  end    

  def profile
    @user = current_user
  end

  private

  def set_property
      @property = Property.find(params[:id])
  end

  def property_params
      params.require(:property).permit(:price, :direction, :area, :room_number, :bathroom_number, images: [])
  end
end
