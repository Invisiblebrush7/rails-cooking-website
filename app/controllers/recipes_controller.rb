class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @recipes = Recipe.all
  end

  def show
    if Recipe.exists?(params[:id])
      @recipe = Recipe.find(params[:id])
    else
      redirect_to recipes_url
    end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    # Change time and servings to integer
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_url
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipes_url
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :time, :servings)
  end

end
