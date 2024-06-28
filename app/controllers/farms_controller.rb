# frozen_string_literal: true

class FarmsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_farm, only: %i[show edit update destroy]

  def index
    @farms = Farm.where(user_id: current_user.id)
  end

  def show; end

  def new
    @farm = Farm.new
  end

  def edit; end

  def create
    @farm = Farm.new(farm_params)
    @farm.user = current_user

    if @farm.save
      redirect_to farms_url, notice: 'Farm was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @farm.update(farm_params)
      redirect_to farm_url(@farm), notice: 'Farm was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @farm.destroy!

    redirect_to farms_url, notice: 'Farm was successfully destroyed.'
  end

  private

  def set_farm
    @farm = Farm.find(params[:id])

    return if @farm.user_id.equal? current_user.id

    redirect_to farms_url, alert: "You don't have permission to view this farm"
  end

  def farm_params
    params.require(:farm).permit(:name, :address, :area)
  end
end
