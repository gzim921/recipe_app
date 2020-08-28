class AddInstructionsToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :instructions, :recipe, foreign_key: true
  end
end
