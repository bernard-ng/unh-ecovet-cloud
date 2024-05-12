class FarmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: %i[ show edit update destroy ]

  def index
    @farms = Farm.all
  end

  def show
  end

  def new
    @farm = Farm.new
    @farm.user = current_user
  end

  def edit
  end

  def create
    @farm = Farm.new(farm_params)

    if @farm.save
      redirect_to farm_url(@farm), notice: "Farm was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @farm.update(farm_params)
      redirect_to farm_url(@farm), notice: "Farm was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @farm.destroy!

    redirect_to farms_url, notice: "Farm was successfully destroyed."
  end

  private
    def set_farm
      @farm = Farm.find(params[:id])
    end

    def farm_params
      params.fetch(:farm, :name, :address, :area)
    end
end
