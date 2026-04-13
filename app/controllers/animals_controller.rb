class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show edit update destroy]
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @animals = Animal.all
  end

  def show; end

  def edit; end

  def new
    @animal = Animal.new
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render 'edit'
    end
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      redirect_to animal_path(@animal)
    else
      render 'new'
    end
  end

  def destroy
    if @animal.destroy
      redirect_to animals_path, notice: 'Animal was successfully destroyed'
    else
      redirect_to animals_path, error: 'Animal could not be destroyed'
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:unique_tag, :species, :breed)
  end

  def invalid_foreign_key
    redirect_to animals_path, notice: 'Animal can not be destroyed.'
  end
end
