class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :find_recipe_with_recipe_id, only: [:edit_ingredients, :edit_instructions]
  before_action :is_user_valid?, except: [:index, :show, :new, :create]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    6.times { @recipe.ingredients.build }
    6.times { @recipe.instructions.build }
  end

  def create
    @recipe = Recipe.new(recipes_params)
    @recipe.user = current_user
    if @recipe.save
      redirect_to user_recipe_path(@recipe.user, @recipe)
    else
      render :new
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
    @recipe.destroy
    redirect_to root_path
  end

  private

  def recipes_params
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

  def is_user_valid?
    unless equal_with_current_user(@recipe.user)
      flash[:warning] = 'Wrong user!'
      redirect_to user_path(@current_user) and return
    end
  end
end
