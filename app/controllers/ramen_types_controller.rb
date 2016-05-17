class RamenTypesController < ApplicationController
  
  def index
    @ramen_types = RamenType.all
  end

  def show
    @ramen_type = RamenType.find(params[:id])
  end

  def edit
    @ramen_type = RamenType.find(params[:id])
  end

  def new
  end 

  def create
    @ramen_type = RamenType.create(name: params[:name], soup_base: params[:soup_base], flavor: params[:flavor], broth_color: params[:broth_color], other_ingredients:params[:other_ingredients])

    redirect_to "/ramen_types/#{@ramen_type.id}"
  end

  def update
    @ramen_type = Unirest.patch("#{ENV['API']}/#{params[:id]}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: type_params).body

    redirect_to "/ramen_types/#{@ramen_type.id}"
  end

  def destroy
    @ramen_type = RamenType.find(params[:id])
    @ramen_type.destroy

    redirect_to "/ramen_types"
  end
end
