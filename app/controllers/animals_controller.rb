class AnimalsController < ApplicationController
  def index
  	@zoo = Zoo.find params[:zoo_id]
  end

  def new
  	@zoo = Zoo.find params[:zoo_id]
  	@animal = Animal.new
  end

  def show
  end

  def edit
  	@animal = Animal.find params[:id]
  end

  def create
  	@zoo = Zoo.find params[:zoo_id]
  	@animal = Animal.new(animal_params)
  	@zoo.animals << @animal
  	@zoo.save

  	# @animal.save
  	redirect_to zoos_path
  end

  def update
  	
  	@animal = Animal.find params[:id]
  	@animal.update(animal_params)
  	redirect_to zoo_animals_path(@animal.zoo)
  end

  def destroy
  	@animal = Animal.find_by_id(params[:id])
  	@animal.destroy
  	redirect_to zoo_animals_path(@animal.zoo)
  end

  private
  	def animal_params
  		params.require(:animal).permit(:name, :age, :species)
  	end
end
