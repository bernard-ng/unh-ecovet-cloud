# frozen_string_literal: true

class AnimalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: %i[show edit update destroy]

  def index
    @animals = Animal.belonging_to_user(current_user.id)
  end

  def show
    @diagnostics = Diagnostic.where(animal_id: @animal.id)
  end

  def new
    @animal = Animal.new
    @farms = Farm.where(user_id: current_user.id)
    @races = json_collection :races
  end

  def edit; end

  def create
    @animal = Animal.new(animal_params)
    @animal.encoded_race = json_collection(:races).select { |r| r.name == animal_params[:race] }.first.id

    if @animal.save
      redirect_to animal_url(@animal), notice: 'Animal was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_url(@animal), notice: 'Animal was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @animal.destroy!

    redirect_to animals_url, notice: 'Animal was successfully destroyed.'
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :race, :gender, :picture, :weight, :birth_at, :farm_id)
  end
end
