class RamenTypesController < ApplicationController
  
  def index
    @ramen_types = Unirest.get("http://localhost:3000/api/v1/ramen_types.json").body
  end

  def show
    @ramen_type = Unirest.get("http://localhost:3000/api/v1/ramen_types/#{params[:id]}.json").body
  end

  def edit
    @ramen_type = Unirest.get("http://localhost:3000/api/v1/ramen_types/#{params[:id]}.json").body
  end

  def new
  end 

  def create
    @ramen_type = Unirest.post("http://localhost:3000/api/v1/ramen_types.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: {:name => params[:name], :soup_base => params[:soup_base], :flavor => params[:flavor], :broth_color => params[:broth_color], :other_ingredients => params[:other_ingredients]}).body

    redirect_to "/ramen_types/#{@ramen_type['id']}"
  end

  def update
    @ramen_type = Unirest.patch("http://localhost:3000/api/v1/ramen_types/#{params[:id]}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: {:name => params[:name], :soup_base => params[:soup_base], :flavor => params[:flavor], :broth_color => params[:broth_color], :other_ingredients => params[:other_ingredients]}).body

    redirect_to "/ramen_types/#{@ramen_type['id']}"
  end

  def destroy
    @ramen_type = Unirest.delete("http://localhost:3000/api/v1/ramen_types/#{params[:id]}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: {:name => params[:name], :soup_base => params[:soup_base], :flavor => params[:flavor], :broth_color => params[:broth_color], :other_ingredients => params[:other_ingredients]}).body

    redirect_to "/ramen_types"
  end

  
end
