require 'rails_helper'

RSpec.describe "RecipesInteraction" do
  let(:user) {create(:user)}
  let(:recipe) {create(:recipe, user: user)}

  before do
    driven_by :rack_test
    log_in(user)

    click_on "New Recipe"
    create_recipe
  end

  describe 'Creating a recipe' do
    it 'creates and shows the newly created cocktail' do
      title = 'New Recipe'
      description = 'Breakfast'
      ingredient = 'Ingredient'
      instruction = 'Instruction'

      click_on "Home"

      expected = page.has_link?('Edit Recipe')

      expect(expected).to be true
      expect(page).to have_content(title)
      expect(page).to have_content(description)
      expect(page).to have_content(ingredient)
      expect(page).to have_content(instruction)
    end
  end

  describe 'Editing a recipe' do
    it 'edits and shows edited recipe' do
      title1 = 'New Recipe'
      description1 = 'Awesome Recipe!'

      click_on "Back"
      click_on "Edit Recipe"

      within('form') do
        fill_in "Title", with: title1
        fill_in "Description", with: description1

        click_on "Update"
      end

      expect(page).to have_content(title1)
      expect(page).to have_content(description1)
    end

    it 'edits and shows edited recipe ingredients' do
      ingredient1 = 'Pancake'

      click_on "Edit/Delete ingredient"

      within('form') do
        fill_in "recipe[ingredients_attributes][0][body]", with: ingredient1

        click_on "Update"
      end

      expect(page).to have_content('Pancake')
    end

    it 'edits and shows edited recipe instructions' do
      instruction1 = 'Omlette'

      click_on "Edit/Delete instruction"

      within('form') do
        fill_in "recipe[instructions_attributes][2][body]", with: instruction1

        click_on "Update"
      end

      expect(page).to have_content(instruction1)
    end
  end

  describe 'Deleting a recipe' do
    it 'deletes the recipe and its ingredients and instructions' do
      click_on 'Back'
      click_on 'Delete'

      expect(page).to have_content('All recipes')
    end
  end
end
