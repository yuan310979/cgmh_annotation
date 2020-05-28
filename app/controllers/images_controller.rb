class ImagesController < ApplicationController
    def index
        @imgs = Image.all
    end

    def show
        @img = Image.find_by_id(params[:id])
    end

    def new 
        @img = Image.new
        # @label = @img.build_label
    end

    def create 
        Image.import(image_params)
        redirect_to images_path, notice: "Images imported"
    end

    private
    def image_params
        params.require(:image).permit(:label, imgs: [])
    end
end
