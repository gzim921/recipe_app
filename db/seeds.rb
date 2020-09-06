User.create([
  {
    user_name: 'gzim921',
    first_name: 'Gzim',
    last_name: 'Iseni',
    email: 'gzimiseni7@gmail.com',
    password: '123456',
    password_confirmation: '123456',
    created_at: '06.09.2020'
  },
  {
    user_name: 'John Smith',
    first_name: 'John',
    last_name: 'Smith',
    email: 'john_smith@gmail.com',
    password: 'johnjohn',
    password_confirmation: 'johnjohn',
    created_at: '06.09.2020'
  }
])

Recipe.create([
  {
    user_id: User.first.id,
    title: 'Overnight Asparagus Mushroom Strata',
    description: "This recipe of my mom's is a colorful make-ahead dish that makes brunch a breeze! Substitute the asparagus with other veggies such as broccoli or zucchini, or add a cup of cooked diced ham or sausage for a non-vegetarian twist.",
    created_at: '06.09.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.first.id,
    body: '2 teaspoons butter, or as needed'
  },
  {
    recipe_id: Recipe.first.id,
    body: '1 ¾ cups sliced crimini mushrooms'
  },
  {
    recipe_id: Recipe.first.id,
    body: '5 eaches English muffins, split and toasted'
  },
  {
    recipe_id: Recipe.first.id,
    body: '1 cup shredded Colby-Monterey Jack cheese'
  },
  {
    recipe_id: Recipe.first.id,
    body: '1 pound fresh asparagus, trimmed and cut into 1-inch pieces'
  }
])

Instruction.create([
  {
    recipe_id: Recipe.first.id,
    body: 'Melt the butter in a skillet over medium heat, and cook and stir the mushrooms until their liquid has mostly evaporated and the mushrooms are beginning to brown, about 10 minutes. Set the mushrooms aside.'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'Grease a 9x13 inch baking dish, and arrange 8 muffin halves, cut sides up, in the bottom of the dish. Stuff pieces of remaining muffins into the spaces between the halves. Spread 1 cup of Colby-Monterey Jack cheese over the muffins in a layer, and distribute the asparagus pieces, mushrooms, red pepper, and onion over the cheese.'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'Whisk together eggs, milk, salt, dry mustard, and black pepper in a bowl, and pour the egg mixture over the muffins and vegetables. Cover the dish, and refrigerate overnight.'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'The next day, preheat oven to 375 degrees F (190 degrees C).'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'Remove the casserole from the refrigerator and let stand for 30 minutes. Spread 1 cup of Colby-Monterey Jack cheese in a layer over the casserole.'
  }
])

Recipe.create([
  {
    user_id: User.first.id,
    title: 'Blueberry Strata',
    description: 'Blueberries, cream cheese,and bread bake in a creamy custard to create the best breakfast ever!',
    created_at: '06.09.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.first.id,
    body: '1 serving cooking spray'
  },
  {
    recipe_id: Recipe.first.id,
    body: '1 loaf French bread, cubed'
  },
  {
    recipe_id: Recipe.first.id,
    body: '1 ½ cups blueberries'
  },
  {
    recipe_id: Recipe.first.id,
    body: '2 (8 ounce) packages cream cheese, cut into 1/2-inch cubes'
  },
  {
    recipe_id: Recipe.first.id,
    body: '12 large eggs eggs'
  }
])

Instruction.create([
  {
    recipe_id: Recipe.first.id,
    body: 'Coat a 9x13 inch baking dish with cooking spray. Place 1/2 of the bread cubes in dish; top with 1 1/2 cups blueberries. Scatter cream cheese over berries. Cover with remaining bread cubes. In a mixing bowl, whisk together eggs, maple syrup, and milk. Pour egg mixture over bread in pan. Cover, and chill overnight.'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'Preheat oven to 350 degrees F (175 degrees C).'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'Bake strata, covered, for 30 minutes. Remove cover, and bake for an additional 30 minutes.'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'While the strata is baking, prepare the blueberry syrup. Combine sugar, cornstarch, and water in a saucepan. Bring mixture to a boil over high heat; cook for 5 minutes. Pour in remaining 1 1/2 cups blueberries; continue cooking for 10 minutes. Remove from heat, and stir in butter. Serve warm over slices of the strata.'
  },
  {
    recipe_id: Recipe.first.id,
    body: 'Prep: 20min'
  }
])

Recipe.create([
  {
    user_id: User.last.id,
    title: 'Вкусна крем чорба со куркума и кари',
    description: 'Кремасто кари, прекрасен басамати ориз, крцкаво зготвени индиски ореви – нашата веганска крем чорба со куркума и кари ќе Ви пружи неверојатно уживање во Вашиот оброк.',
    created_at: '06.09.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.last.id,
    body: '400 гр. басамати ориз'
  },
  {
    recipe_id: Recipe.last.id,
    body: '80 мл. DmBio масло за пржење'
  },
  {
    recipe_id: Recipe.last.id,
    body: '150 гр. кромид'
  },
  {
    recipe_id: Recipe.last.id,
    body: '1 чили пиперче'
  },
  {
    recipe_id: Recipe.last.id,
    body: '40 гр. ѓумбир'
  }
])

Instruction.create([
  {
    recipe_id: Recipe.last.id,
    body: 'Басамати оризот гответе го во голема количина вода околу 15 минути.'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'На коцки исечканиот кромид, чили пиперче, исечениот ѓумбир и иситнетите чешниња лук додадете ги во сад со масло за пржење и динстајте околу 4 минути на среден оган.'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'Додадете го кимот, куркумата, на ленти исечената пиперка, 2 лажички сол со билки и доматен сос во садот и оставете лесно да се пропржи. Потоа додадете го кокосовото млеко.'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'Зачинете со малку сол со билки, сок од лимон и црн бибер..'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'Убаво измешајте и оставете да се готви околу 8 минути.'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'Индиските ореви ставете ги во тава и на среден оган лесно пропржете ги со масло за пржење. На тоа додадете го одозгора свежиот коријандер.'
  }
])

Recipe.create([
  {
    user_id: User.last.id,
    title: 'Кремаста веган паста',
    description: 'Органски шпагети од крупник во кремаст вегански сос од индиски ореви, комбинирани со вкусни траки од тиквички и динстана леблебија – оваа кремаста паста е вистинско уживање за сечиј вкус.',
    created_at: '06.09.2020'
  }
])

Ingredient.create([
  {
    recipe_id: Recipe.last.id,
    body: '75 гр DmBio индиски ореви'
  },
  {
    recipe_id: Recipe.last.id,
    body: '300 гр сладок компир'
  },
  {
    recipe_id: Recipe.last.id,
    body: '½ кромид'
  },
  {
    recipe_id: Recipe.last.id,
    body: '1 чешне лук'
  },
  {
    recipe_id: Recipe.last.id,
    body: '200 мл крем за готвење од овес'
  }
])

Instruction.create([
  {
    recipe_id: Recipe.last.id,
    body: ' Индиските ореви потопете ги во голема количина вода и оставете ги околу 2 часа.'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'Излупете ги слатките компири, исечкајте ги на мали парченца и во зовриена вода оставете околу 20 минути да се сварат.'
  },
  {
    recipe_id: Recipe.last.id,
    body: ' Лукот и кромидот исечкајте ги на ситни парченца. Ставете ги во тава со масло за пржење и малку издинстајте ги.'
  },
  {
    recipe_id: Recipe.last.id,
    body: 'Потопените индиски ореви, компирите и кромидот и лукот ставете ги во блендер заедно со кремот за готвење од овес, 1 пиперка и блендирајте околу 3 минути додека не добиете кремаста текстура. На крај, сосот додадете го во тава и гответе на среден оган со постојано мешање околу 3 минути.'
  }
])
