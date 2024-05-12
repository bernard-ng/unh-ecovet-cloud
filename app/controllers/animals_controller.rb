class AnimalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_animal, only: %i[ show edit update destroy ]

  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def edit
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      redirect_to animal_url(@animal), notice: "Animal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_url(@animal), notice: "Animal was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @animal.destroy!

    redirect_to animals_url, notice: "Animal was successfully destroyed."
  end

  private
    def set_animal
      @animal = Animal.find(params[:id])
    end

    def animal_params
      params.fetch(:animal, {})
    end
end
