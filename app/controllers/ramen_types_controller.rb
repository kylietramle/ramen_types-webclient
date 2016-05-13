class RamenTypesController < ApplicationController
  
  def index
    @ramen_types = Unirest.get("#{ENV['API']}.json").body
  end

  def show
    @ramen_type = Unirest.get("#{ENV['API']}/#{params[:id]}.json").body
  end

  def edit
    @ramen_type = Unirest.get("#{ENV['API']}/#{params[:id]}.json").body
  end

  def new
  end 

  def create
    @ramen_type = Unirest.post("#{ENV['API']}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: {:name => params[:name], :soup_base => params[:soup_base], :flavor => params[:flavor], :broth_color => params[:broth_color], :other_ingredients => params[:other_ingredients]}).body

    redirect_to "/ramen_types/#{@ramen_type['id']}"
  end

  def update
    @ramen_type = Unirest.patch("#{ENV['API']}/#{params[:id]}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: {:name => params[:name], :soup_base => params[:soup_base], :flavor => params[:flavor], :broth_color => params[:broth_color], :other_ingredients => params[:other_ingredients]}).body

    redirect_to "/ramen_types/#{@ramen_type['id']}"
  end

  def destroy
    @ramen_type = Unirest.delete("#{ENV['API']}/#{params[:id]}.json",
                  headers:{ "Accept" => "application/json" },
                  parameters: {:name => params[:name], :soup_base => params[:soup_base], :flavor => params[:flavor], :broth_color => params[:broth_color], :other_ingredients => params[:other_ingredients]}).body

    redirect_to "/ramen_types"
  end  
end
