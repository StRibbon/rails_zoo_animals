class ZoosController < ApplicationController
  def index
  	@zoos = Zoo.all
  	render :index
  end

  def new
  	@zoo = Zoo.new
  end

  def show
  end

  def edit
  	@zoo = Zoo.find_by_id(params[:id])
  end

  def create
  	@zoo = Zoo.new(zoo_params)
  	@zoo.save
  	redirect_to zoos_path
  end

  def update
  	@zoo = Zoo.find_by_id(params[:id])
  	if @zoo.update(zoo_params)
  	redirect_to zoos_path

    else render :edit
    end
  end

  def destroy
  	@zoo = Zoo.find_by_id(params[:id])
  	@zoo.destroy
  	redirect_to zoos_path
  end


  private
    def zoo_params
      params.require(:zoo).permit(:name,:location)
    end
end
