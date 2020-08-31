class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :find_recipe_with_recipe_id, only: [:edit_ingredients, :edit_instructions]
  
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
    @recipe.ingredients.find_all
    @recipe.instructions.find_all
  end

  def edit_instructions
    @recipe.instructions.find_all
  end

  def edit_ingredients
    @recipe.ingredients.find_all
  end

  def update
    @recipe.update_attributes(recipes_params)
    if @recipe.save
      redirect_to user_recipe_path(@recipe.user, @recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to root_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description,
    ingredients_attributes: [:id, :recipe_id, :body, :_destroy],
    instructions_attributes: [:id, :recipe_id, :body, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def find_recipe_with_recipe_id
    @recipe = Recipe.find(params[:recipe_id])
  end
end
