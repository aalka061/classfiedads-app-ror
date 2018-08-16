class AdsController < ApplicationController

    def index
    
        if params[:search_term]
            logger.info("Hi"+params[:search_term])
            @ads = Ad.where('title LIKE ?', '%'+ params[:search_term]+'%')
        else
             @ads = Ad.all
        end
        
        
    end
    def new 
        @ad = Ad.new
    end

    def create
        @ad = Ad.create(get_ad_params)
        if @ad.save
            flash[:success] = "Successfully created..."
            redirect_to root_path
        end

    end
    def edit
        @ad = Ad.find(params[:id])

    end

    def update
        @ad = Ad.find(params[:id])
        @ad.update_attributes(get_ad_params)
        redirect_to root_path


    end
    def destroy
        @ad = Ad.find(params[:id])
        @ad.destroy
        redirect_to root_path
    end

    private 
    def get_ad_params
        params.require(:ad).permit(:title, :description, :location, :price, images: [])
    end
end

