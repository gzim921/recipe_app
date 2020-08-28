class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    5.times { @recipe.ingredients.build }
    5.times { @recipe.instructions.build }
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      redirect_to root_path
    else
      render:new
    end
  end

  def edit
    # @recipe = Recipe.find(params[:id])
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description,
    ingredients_attributes: [:id, :recipe_id, :body, :_destroy],
    instructions_attributes: [:id, :recipe_id, :body, :_destroy])
  end
end
