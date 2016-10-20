require './config/environment'

class RecipeController < ApplicationController


  get '/recipes' do
    @recipes = Recipe.all
    erb :'/recipe/recipes'
  end

  get '/recipes/new' do
    @categories = Category.all
    erb :'/recipe/create'
  end

  post '/recipes' do
    if !params["category"] && params["new_category"].empty?
      redirect to '/recipes/new'
    elsif !params["new_category"].empty?
      r = Recipe.new
      r.name = params["name"]
      r.ingredients = params["ingredients"]
      r.serving_size = params["serving_size"].to_i
      r.cook_time = params["cook_time"]
      r.directions = params["directions"]

      r.category = Category.find_or_create_by(name: params["new_category"].strip.downcase.capitalize)
      r.user = current_user
      r.save

      redirect to "/recipes/#{r.id}"
    else
      r = Recipe.new
      r.name = params["name"]
      r.ingredients = params["ingredients"]
      r.serving_size = params["serving_size"].to_i
      r.cook_time = params["cook_time"]
      r.directions = params["directions"]

      r.category = Category.find_by_id(params["category"])
      r.user = current_user
      r.save

      redirect to "/recipes/#{r.id}"
    end
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :'/recipe/show'
  end



end