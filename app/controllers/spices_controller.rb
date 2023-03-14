class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def create
        spice = Spice.create(spice_pramas)
        render json: spice, status: :created
    end 
    
    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_pramas)
        render json: spice
    end
    
    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private
    
    def spice_pramas
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
