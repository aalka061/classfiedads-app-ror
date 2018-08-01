class AdsController < ApplicationController

    def index
        @ads = Ad.all
    end
    def new 
        @ad = Ad.new
    end
end
