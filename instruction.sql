CREATE DATABASE recipess;
USE recipess;
SELECT @@sql_mode;
SET GLOBAL sql_mode = 'TRADITIONAL';
CREATE TABLE Recipe (
    recipe_id INT PRIMARY KEY,
    name VARCHAR(255),
    description TEXT,
    category VARCHAR(50),
    prep_time INT,
    cook_time INT,
    servings INT,
    rating DECIMAL(2, 1),
    vegetarian BOOLEAN
);

-- Ingredient Table
CREATE TABLE Ingredient (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    name VARCHAR(255),
    quantity DECIMAL(10, 2),
    unit VARCHAR(50),
    description TEXT,
    category VARCHAR(50),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-- Instruction Table
CREATE TABLE Instruction (
    instruction_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    step_number INT,
    instruction_text TEXT,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-- NutritionInfo Table
CREATE TABLE NutritionInfo (
    nutrition_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    calories INT,
    protein DECIMAL(10, 2),
    carbs DECIMAL(10, 2),
    sodium INT,
    fiber DECIMAL(10, 2),
    fat DECIMAL(10, 2),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);
-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (1, 'Omlette', 'Healthy and delicious omelette with vegetables', 'Breakfast', 10, 15, 3, 4.8, TRUE);

-- Ingredient Data for Veggie Omelette
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(1, 'Eggs', 3, 'units', 'Large eggs', 'Protein'),
(1, 'Spinach', 1, 'cup', 'Fresh spinach leaves', 'Vegetable'),
(1, 'Tomato', 1, 'medium', 'Fresh tomato', 'Vegetable'),
(1, 'Onion', 1, 'small', 'Onion', 'Vegetable'),
(1, 'Bell pepper', 1, 'small', 'Bell pepper', 'Vegetable'),
(1, 'Salt', 0.5, 'teaspoon', 'Salt', 'Seasoning'),
(1, 'Black pepper', 0.25, 'teaspoon', 'Black pepper', 'Seasoning'),
(1, 'Olive oil', 2, 'tablespoons', 'Olive oil', 'Cooking oil');

-- Instruction Data for Veggie Omelette
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(1, 1, 'Heat olive oil in a pan.'),
(1, 2, 'Add chopped onion and bell pepper, sauté until tender.'),
(1, 3, 'Add spinach and cook until wilted.'),
(1, 4, 'Beat eggs in a bowl and season with salt and black pepper.'),
(1, 5, 'Pour egg mixture into the pan with vegetables.'),
(1, 6, 'Cook until eggs are set, flipping once if needed.'),
(1, 7, 'Serve hot with tomato slices on the side.');

-- Nutrition Info Data for Veggie Omelette
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (1, 250, 15, 350, 600, 3, 20);





-- Recipe Data for Avocado Toast
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (2, 'Avocado Toast', 'Simple and delicious avocado toast', 'Breakfast', 5, 5, 2, 4.9, TRUE);

-- Ingredient Data for Avocado Toast
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(2, 'Avocado', 1, 'ripe', 'Ripe avocado', 'Fruit'),
(2, 'Bread slices', 2, 'pieces', 'Whole grain bread slices', 'Grain'),
(2, 'Lemon juice', 1, 'teaspoon', 'Fresh lemon juice', 'Citrus'),
(2, 'Salt', 0.25, 'teaspoon', 'Salt', 'Seasoning'),
(2, 'Black pepper', 0.25, 'teaspoon', 'Black pepper', 'Seasoning'),
(2, 'Red chili flakes', 0.5, 'teaspoon', 'Red chili flakes', 'Seasoning');

-- Instruction Data for Avocado Toast
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(2, 1, 'Toast bread slices until golden brown.'),
(2, 2, 'Mash avocado in a bowl and mix with lemon juice, salt, and black pepper.'),
(2, 3, 'Spread avocado mixture evenly on toasted bread slices.'),
(2, 4, 'Sprinkle red chili flakes on top for added spice.'),
(2, 5, 'Serve immediately and enjoy!');

-- Nutrition Info Data for Avocado Toast
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (2, 180, 10, 0.00, 200, 1.00, 5.00);



-- Recipe Data for Kibbeh
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (3, 'Kibbeh', 'Traditional Middle Eastern dish made with ground lamb and bulgur wheat', 'Main Course', 30, 20, 4, 4.0, TRUE);

-- Ingredient Data for Kibbeh
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(3, 'Ground lamb', 1, 'lb', 'Lean ground lamb', 'Meat'),
(3, 'Bulgur wheat', 1, 'cup', 'Fine bulgur wheat', 'Grain'),
(3, 'Onion', 1, 'medium', 'Onion, finely chopped', 'Vegetable'),
(3, 'Pine nuts', 0.5, 'cup', 'Toasted pine nuts', 'Nut'),
(3, 'Allspice', 1, 'teaspoon', 'Ground allspice', 'Seasoning'),
(3, 'Cinnamon', 0.5, 'teaspoon', 'Ground cinnamon', 'Seasoning'),
(3, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(3, 'Black pepper', 0.5, 'teaspoon', 'Black pepper', 'Seasoning');

-- Instruction Data for Kibbeh
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(3, 1, 'Soak bulgur wheat in water for 30 minutes, then drain.'),
(3, 2, 'Combine ground lamb, soaked bulgur, chopped onion, pine nuts, allspice, cinnamon, salt, and black pepper in a bowl.'),
(3, 3, 'Mix thoroughly until well combined.'),
(3, 4, 'Form mixture into oval-shaped patties.'),
(3, 5, 'Heat oil in a skillet and cook kibbeh patties until browned and cooked through.'),
(3, 6, 'Serve hot with a side of yogurt sauce and salad.');

-- Nutrition Info Data for Kibbeh
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (3, 350, 20, 70, 500, 2, 25);

-- Recipe Data for Classic Burger and Fries
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (4, 'Classic Burger and Fries', 'All-time favorite burger with crispy fries', 'Main Course', 20, 15, 4, 4.0, TRUE);

-- Ingredient Data for Classic Burger and Fries
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(4, 'Ground beef', 1, 'lb', 'Ground beef (80% lean)', 'Meat'),
(4, 'Burger buns', 4, 'pieces', 'Burger buns', 'Bread'),
(4, 'Cheese slices', 4, 'pieces', 'Cheddar cheese slices', 'Dairy'),
(4, 'Lettuce', 4, 'leaves', 'Fresh lettuce leaves', 'Vegetable'),
(4, 'Tomato', 2, 'slices', 'Fresh tomato slices', 'Vegetable'),
(4, 'Onion', 1, 'small', 'Red onion, thinly sliced', 'Vegetable'),
(4, 'Pickles', 8, 'pieces', 'Dill pickle slices', 'Condiment'),
(4, 'Ketchup', 2, 'tablespoons', 'Ketchup', 'Condiment'),
(4, 'Mustard', 1, 'tablespoon', 'Yellow mustard', 'Condiment'),
(4, 'Potatoes', 4, 'medium', 'Potatoes', 'Vegetable'),
(4, 'Vegetable oil', 2, 'tablespoons', 'Vegetable oil', 'Cooking oil'),
(4, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(4, 'Black pepper', 0.5, 'teaspoon', 'Black pepper', 'Seasoning');

-- Instruction Data for Classic Burger and Fries
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(4, 1, 'Preheat grill or skillet to medium-high heat.'),
(4, 2, 'Season ground beef with salt and black pepper, then shape into patties.'),
(4, 3, 'Grill or cook patties until desired doneness, adding cheese slices to melt.'),
(4, 4, 'Toast burger buns on the grill or in a toaster.'),
(4, 5, 'Assemble burgers with lettuce, tomato, onion, pickles, ketchup, and mustard.'),
(4, 6, 'Wash and cut potatoes into fries shape.'),
(4, 7, 'Toss fries with vegetable oil, salt, and black pepper.'),
(4, 8, 'Bake fries in the oven until crispy and golden brown.'),
(4, 9, 'Serve hot burgers with fries on the side.');

-- Nutrition Info Data for Classic Burger and Fries
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (4, 700, 40, 100, 600, 3, 25);




-- Recipe Data for Sushi
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (5, 'Sushi', 'Delicious sushi rolls with fresh ingredients', 'Appetizer', 30, 0, 4, 4.9, TRUE);

-- Ingredient Data for Sushi
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(5, 'Sushi rice', 2, 'cups', 'Sushi rice', 'Grain'),
(5, 'Nori sheets', 4, 'sheets', 'Nori seaweed sheets', 'Seafood'),
(5, 'Sashimi-grade fish', 8, 'ounces', 'Sashimi-grade fish slices (e.g., tuna, salmon)', 'Seafood'),
(5, 'Avocado', 1, 'medium', 'Ripe avocado, sliced', 'Fruit'),
(5, 'Cucumber', 1, 'medium', 'Seedless cucumber, julienned', 'Vegetable'),
(5, 'Carrot', 1, 'small', 'Carrot, julienned', 'Vegetable'),
(5, 'Soy sauce', 2, 'tablespoons', 'Soy sauce', 'Condiment'),
(5, 'Wasabi', 1, 'teaspoon', 'Wasabi paste', 'Condiment'),
(5, 'Pickled ginger', 2, 'tablespoons', 'Pickled ginger slices', 'Condiment');

-- Instruction Data for Sushi
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(5, 1, 'Cook sushi rice according to package instructions and let cool.'),
(5, 2, 'Place a sheet of nori on a bamboo sushi mat.'),
(5, 3, 'Spread a thin layer of sushi rice over the nori, leaving a small border at the top.'),
(5, 4, 'Arrange fish, avocado, cucumber, and carrot strips along the bottom edge of the rice.'),
(5, 5, 'Roll the sushi tightly using the bamboo mat, moistening the top border of nori to seal.'),
(5, 6, 'Slice the sushi roll into bite-sized pieces.'),
(5, 7, 'Serve with soy sauce, wasabi, and pickled ginger on the side.');

-- Nutrition Info Data for Sushi
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (5, 300, 5, 50, 600, 1, 15);

-- Recipe Data for Tabbouleh
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (6, 'Tabbouleh', 'Healthy and flavorful Middle Eastern salad', 'Salad', 30, 0, 6, 4.7, TRUE);

-- Ingredient Data for Tabbouleh
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(6, 'Bulgur wheat', 1, 'cup', 'Fine bulgur wheat', 'Grain'),
(6, 'Tomatoes', 2, 'medium', 'Ripe tomatoes, diced', 'Vegetable'),
(6, 'Cucumber', 1, 'medium', 'Seedless cucumber, diced', 'Vegetable'),
(6, 'Green onions', 4, 'stalks', 'Green onions, chopped', 'Vegetable'),
(6, 'Fresh parsley', 1, 'bunch', 'Fresh parsley, chopped', 'Herb'),
(6, 'Fresh mint', 0.5, 'cup', 'Fresh mint leaves, chopped', 'Herb'),
(6, 'Lemon juice', 4, 'tablespoons', 'Fresh lemon juice', 'Citrus'),
(6, 'Olive oil', 3, 'tablespoons', 'Extra virgin olive oil', 'Oil'),
(6, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(6, 'Black pepper', 0.5, 'teaspoon', 'Black pepper', 'Seasoning');

-- Instruction Data for Tabbouleh
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(6, 1, 'Soak bulgur wheat in water for 30 minutes, then drain.'),
(6, 2, 'Combine soaked bulgur wheat, diced tomatoes, diced cucumber, chopped green onions, chopped parsley, and chopped mint in a large bowl.'),
(6, 3, 'Drizzle lemon juice and olive oil over the mixture.'),
(6, 4, 'Season with salt and black pepper, then toss well to combine.'),
(6, 5, 'Refrigerate for at least 1 hour to allow flavors to meld.'),
(6, 6, 'Serve chilled as a refreshing salad or side dish.');

-- Nutrition Info Data for Tabbouleh
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (6, 150, 7, 0, 200, 2, 3);

-- Recipe Data for Riz au Djej
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (7, 'riz au djej', 'Lebanese-style chicken and rice dish with nuts', 'Main Course', 30, 45, 6, 4.8, TRUE);

-- Ingredient Data for Riz au Djej
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(7, 'Chicken', 1, 'whole', 'Whole chicken', 'Meat'),
(7, 'Rice', 2, 'cups', 'Long-grain rice', 'Grain'),
(7, 'Onion', 1, 'large', 'Yellow onion, chopped', 'Vegetable'),
(7, 'Butter', 4, 'tablespoons', 'Unsalted butter', 'Dairy'),
(7, 'Cinnamon', 1, 'teaspoon', 'Ground cinnamon', 'Seasoning'),
(7, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(7, 'Black pepper', 0.5, 'teaspoon', 'Black pepper', 'Seasoning'),
(7, 'Almonds', 0.5, 'cup', 'Sliced almonds, toasted', 'Nut'),
(7, 'Pine nuts', 0.5, 'cup', 'Pine nuts, toasted', 'Nut'),
(7, 'Chicken broth', 3, 'cups', 'Chicken broth', 'Stock');

-- Instruction Data for Riz au Djej
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(7, 1, 'Cook rice according to package instructions and set aside.'),
(7, 2, 'Season chicken with cinnamon, salt, and black pepper.'),
(7, 3, 'In a large pot, melt butter and sauté chopped onion until translucent.'),
(7, 4, 'Add seasoned chicken to the pot and brown on all sides.'),
(7, 5, 'Pour chicken broth over the chicken, cover, and simmer until chicken is cooked through.'),
(7, 6, 'Remove chicken from the pot and shred the meat.'),
(7, 7, 'In the same pot, layer cooked rice, shredded chicken, and toasted almonds and pine nuts.'),
(7, 8, 'Cover the pot and cook over low heat to allow flavors to meld.'),
(7, 9, 'Serve hot, garnished with additional toasted nuts.');

-- Nutrition Info Data for Riz au Djej
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (7, 450, 25, 120, 800, 3, 20);

-- Recipe Data for Stuffed Grape Leaves
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (8, 'Stuffed Grape Leaves', 'Classic Mediterranean dish with rice and herbs', 'Appetizer', 30, 60, 20, 4.5, TRUE);

-- Ingredient Data for Stuffed Grape Leaves
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(8, 'Grape leaves', 1, 'jar', 'Grape leaves, preserved in brine', 'Leaves'),
(8, 'Rice', 1, 'cup', 'Long-grain rice', 'Grain'),
(8, 'Tomato', 2, 'large', 'Tomatoes, diced', 'Vegetable'),
(8, 'Onion', 1, 'medium', 'Onion, chopped', 'Vegetable'),
(8, 'Parsley', 0.5, 'cup', 'Fresh parsley, chopped', 'Herb'),
(8, 'Mint', 0.25, 'cup', 'Fresh mint, chopped', 'Herb'),
(8, 'Lemon juice', 0.25, 'cup', 'Fresh lemon juice', 'Citrus'),
(8, 'Olive oil', 0.5, 'cup', 'Extra virgin olive oil', 'Oil'),
(8, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(8, 'Pepper', 0.5, 'teaspoon', 'Black pepper', 'Seasoning');

-- Instruction Data for Stuffed Grape Leaves
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(8, 1, 'Rinse grape leaves in warm water and drain.'),
(8, 2, 'In a bowl, mix rice, diced tomatoes, chopped onion, parsley, mint, lemon juice, olive oil, salt, and pepper.'),
(8, 3, 'Place a grape leaf flat on a work surface, vein side up, and trim the stem if necessary.'),
(8, 4, 'Place a spoonful of the rice mixture near the stem end of the grape leaf.'),
(8, 5, 'Fold the sides of the grape leaf over the filling and roll it tightly into a cigar shape.'),
(8, 6, 'Repeat with the remaining grape leaves and filling.'),
(8, 7, 'Arrange the stuffed grape leaves in a pot, seam side down, in a single layer.'),
(8, 8, 'Add water to cover the grape leaves and place a heavy plate on top to keep them submerged.'),
(8, 9, 'Bring to a boil, then reduce heat and simmer for 45 minutes to 1 hour, until the rice is cooked and tender.'),
(8, 10, 'Remove from heat and let cool slightly before serving.');

-- Nutrition Info Data for Stuffed Grape Leaves
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (8, 200, 8, 0, 400, 3, 4);

-- Recipe Data for Mloukhieh
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (9, 'Mloukhiye', 'Traditional Middle Eastern dish with mloukhieh leaves and chicken', 'Main Course', 30, 30, 4, 4.8, TRUE);

-- Ingredient Data for Mloukhieh
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(9, 'Mloukhieh leaves', 2, 'cups', 'Fresh mloukhieh leaves', 'Leaves'),
(9, 'Chicken broth', 4, 'cups', 'Chicken broth', 'Liquid'),
(9, 'Garlic', 4, 'cloves', 'Garlic, minced', 'Seasoning'),
(9, 'Coriander', 1, 'tablespoon', 'Ground coriander', 'Seasoning'),
(9, 'Cumin', 1, 'teaspoon', 'Ground cumin', 'Seasoning'),
(9, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(9, 'Olive oil', 2, 'tablespoons', 'Olive oil', 'Oil'),
(9, 'Chicken', 1, 'pound', 'Chicken breast or thigh, cooked and shredded', 'Meat');

-- Instruction Data for Mloukhieh
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(9, 1, 'Wash mloukhieh leaves and drain well.'),
(9, 2, 'In a pot, heat olive oil and sauté minced garlic until golden.'),
(9, 3, 'Add ground coriander, ground cumin, and salt to the pot, and cook for 1 minute.'),
(9, 4, 'Add chicken broth to the pot and bring to a boil.'),
(9, 5, 'Add mloukhieh leaves to the boiling broth, reduce heat, and simmer for 10-15 minutes until tender.'),
(9, 6, 'Serve mloukhieh hot over cooked rice or with bread, topped with shredded cooked chicken.');

-- Nutrition Info Data for Mloukhieh
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (9, 250, 12, 40, 900, 5, 20);

-- Recipe Data for Koussa
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (10, 'zucchini', 'Stuffed zucchini with meat and rice filling', 'Main Course', 30, 40, 6, 4.7, TRUE);

-- Ingredient Data for Koussa
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(10, 'Zucchini', 6, 'medium', 'Fresh zucchini', 'Vegetable'),
(10, 'Ground beef', 1, 'pound', 'Ground beef', 'Meat'),
(10, 'Rice', 0.5, 'cup', 'Uncooked rice', 'Grain'),
(10, 'Onion', 1, 'medium', 'Onion, finely chopped', 'Vegetable'),
(10, 'Tomato', 2, 'medium', 'Tomatoes, diced', 'Vegetable'),
(10, 'Garlic', 2, 'cloves', 'Garlic, minced', 'Seasoning'),
(10, 'Parsley', 0.25, 'cup', 'Fresh parsley, chopped', 'Herb'),
(10, 'Mint', 0.25, 'cup', 'Fresh mint, chopped', 'Herb'),
(10, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(10, 'Pepper', 0.5, 'teaspoon', 'Black pepper', 'Seasoning');

-- Instruction Data for Koussa
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(10, 1, 'Cut off the tops of the zucchini and hollow them out using a zucchini corer or spoon, leaving a shell.'),
(10, 2, 'In a bowl, mix ground beef, uncooked rice, chopped onion, minced garlic, chopped parsley, chopped mint, salt, and pepper.'),
(10, 3, 'Stuff the zucchini shells with the meat and rice mixture.'),
(10, 4, 'Place the stuffed zucchini in a pot, layering them with diced tomatoes.'),
(10, 5, 'Add enough water to cover the zucchini, then cover the pot and simmer for 30-40 minutes until the zucchini are tender and the filling is cooked.'),
(10, 6, 'Serve Koussa hot, garnished with additional chopped parsley and mint.');

-- Nutrition Info Data for Koussa
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (10, 300, 15, 50, 600, 4, 25);

-- Recipe Data for Cheese Rolls
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (11, 'Cheese Rolls', 'Savory cheese-filled pastry rolls', 'Appetizer', 20, 20, 12, 4.5, TRUE);

-- Ingredient Data for Cheese Rolls
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(11, 'Puff pastry sheets', 2, 'sheets', 'Puff pastry sheets', 'Pastry'),
(11, 'Cream cheese', 1, 'cup', 'Softened cream cheese', 'Dairy'),
(11, 'Mozzarella', 1, 'cup', 'Shredded mozzarella cheese', 'Dairy'),
(11, 'Parmesan', 0.5, 'cup', 'Grated Parmesan cheese', 'Dairy'),
(11, 'Egg', 1, 'unit', 'Beaten egg for brushing', 'Dairy');

-- Instruction Data for Cheese Rolls
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(11, 1, 'Preheat oven to 375°F (190°C) and line a baking sheet with parchment paper.'),
(11, 2, 'Roll out puff pastry sheets on a floured surface.'),
(11, 3, 'In a bowl, mix together softened cream cheese, shredded mozzarella, and grated Parmesan.'),
(11, 4, 'Spread the cheese mixture evenly over the puff pastry sheets.'),
(11, 5, 'Roll up the puff pastry sheets tightly into logs and seal the edges.'),
(11, 6, 'Cut the logs into smaller rolls.'),
(11, 7, 'Place the rolls on the prepared baking sheet, seam side down.'),
(11, 8, 'Brush the rolls with beaten egg for a golden finish.'),
(11, 9, 'Bake in the preheated oven for 15-20 minutes until golden brown and puffed.'),
(11, 10, 'Allow Cheese Rolls to cool slightly before serving.');

-- Nutrition Info Data for Cheese Rolls
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (11, 200, 12, 35, 300, 2, 8);

-- Recipe Data for Batata Harra
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (12, 'spicy potato', 'Spicy Lebanese potatoes', 'Appetizer', 15, 20, 4, 4.8, TRUE);

-- Ingredient Data for Batata Harra
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(12, 'Potatoes', 4, 'medium', 'Potatoes, peeled and diced', 'Vegetable'),
(12, 'Olive oil', 3, 'tablespoons', 'Olive oil', 'Oil'),
(12, 'Garlic', 3, 'cloves', 'Garlic, minced', 'Seasoning'),
(12, 'Red chili pepper', 1, '', 'Red chili pepper, chopped', 'Spice'),
(12, 'Paprika', 1, 'teaspoon', 'Paprika powder', 'Seasoning'),
(12, 'Salt', 1, 'teaspoon', 'Salt', 'Seasoning'),
(12, 'Fresh cilantro', 0.5, 'cup', 'Fresh cilantro, chopped', 'Herb');

-- Instruction Data for Batata Harra
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(12, 1, 'Heat olive oil in a pan over medium heat.'),
(12, 2, 'Add minced garlic, chopped red chili pepper, and paprika powder to the hot oil.'),
(12, 3, 'Saute for a minute until fragrant, then add diced potatoes to the pan.'),
(12, 4, 'Season with salt and stir well to coat the potatoes with the spices.'),
(12, 5, 'Cook the potatoes until crispy and golden brown on all sides, stirring occasionally.'),
(12, 6, 'Once cooked, remove from heat and sprinkle fresh chopped cilantro over the potatoes.'),
(12, 7, 'Serve Batata Harra hot as a delicious side dish or appetizer.');

-- Nutrition Info Data for Batata Harra
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (12, 180, 8, 0, 450, 2, 3);



-- Recipe Data for Berry Blast Smoothie Bowl
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (13, 'Berry Blast Smoothie Bowl', 'Refreshing and fruity smoothie bowl', 'Breakfast', 5, 0, 1, 4.0, TRUE);

-- Ingredient Data for Berry Blast Smoothie Bowl
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(13, 'Berries', 1, 'cup', 'Mixed berries', 'Fruit'),
(13, 'Yogurt', 1, 'cup', 'Greek yogurt', 'Dairy'),
(13, 'Banana', 1, 'medium', 'Ripe banana', 'Fruit'),
(13, 'Honey', 1, 'tablespoon', 'Honey', 'Sweetener'),
(13, 'Almond milk', 1, 'cup', 'Unsweetened almond milk', 'Liquid');

-- Instruction Data for Berry Blast Smoothie Bowl
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(13, 1, 'Combine berries, yogurt, banana, honey, and almond milk in a blender.'),
(13, 2, 'Blend until smooth and creamy.'),
(13, 3, 'Pour into a bowl and top with additional berries, sliced banana, and granola.'),
(13, 4, 'Serve immediately and enjoy!');

-- Nutrition Info Data for Berry Blast Smoothie Bowl
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (13, 200, 5, 10, 100, 25, 8);

-- Recipe Data for Greek Yogurt Parfait
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (14, 'Greek Yogurt Parfait', 'Healthy and delicious yogurt parfait', 'Breakfast', 5, 0, 1, 3.0, TRUE);

-- Ingredient Data for Greek Yogurt Parfait
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(14, 'Greek yogurt', 1, 'cup', 'Plain Greek yogurt', 'Dairy'),
(14, 'Granola', 0.5, 'cup', 'Granola', 'Grain'),
(14, 'Berries', 0.5, 'cup', 'Mixed berries', 'Fruit'),
(14, 'Honey', 1, 'tablespoon', 'Honey', 'Sweetener'),
(14, 'Almonds', 2, 'tablespoons', 'Sliced almonds', 'Nuts');

-- Instruction Data for Greek Yogurt Parfait
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(14, 1, 'Layer Greek yogurt, granola, and berries in a glass or bowl.'),
(14, 2, 'Drizzle honey over the top.'),
(14, 3, 'Sprinkle sliced almonds as a final garnish.'),
(14, 4, 'Repeat layers if desired.'),
(14, 5, 'Serve immediately and enjoy!');

-- Nutrition Info Data for Greek Yogurt Parfait
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (14, 250, 10, 5, 100, 15, 12);

-- Recipe Data for Baklava
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (15, 'Baklava', 'Traditional Middle Eastern pastry with nuts and honey', 'Dessert', 30, 50, 24, 4.9, TRUE);

-- Ingredient Data for Baklava
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(15, 'Phyllo dough', 1, 'package', 'Phyllo dough sheets', 'Pastry'),
(15, 'Butter', 1, 'cup', 'Melted butter', 'Dairy'),
(15,'Walnuts', 1, 'cup', 'Crushed walnuts', 'Nut'),
(15, 'Almonds', 1, 'cup', 'Crushed almonds', 'Nut'),
(15, 'Cinnamon', 1, 'teaspoon', 'Ground cinnamon', 'Spice'),
(15, 'Sugar', 1, 'cup', 'Granulated sugar', 'Sweetener'),
(15, 'Honey', 0.5, 'cup', 'Honey', 'Sweetener'),
(15, 'Water', 0.5, 'cup', 'Water', 'Liquid'),
(15, 'Lemon juice', 1, 'tablespoon', 'Lemon juice', 'Citrus');

-- Instruction Data for Baklava
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(15, 1, 'Preheat oven to 350°F (175°C).'),
(15, 2, 'Combine crushed walnuts, crushed almonds, and ground cinnamon in a bowl.'),
(15, 3, 'Layer phyllo dough sheets in a greased baking dish, brushing each sheet with melted butter.'),
(15, 4, 'Spread the nut mixture evenly over the phyllo dough layers.'),
(15, 5, 'Continue layering phyllo dough and brushing with butter until all dough and nut mixture are used.'),
(15, 6, 'Cut the baklava into diamond or square shapes using a sharp knife.'),
(15, 7, 'Bake in the preheated oven for 45-50 minutes or until golden brown and crispy.'),
(15, 8, 'While baking, combine sugar, water, honey, and lemon juice in a saucepan and bring to a boil.'),
(15, 9, 'Reduce heat and simmer for 10 minutes to make the syrup.'),
(15, 10, 'Pour the hot syrup over the hot baklava as soon as it comes out of the oven.'),
(15, 11, 'Allow the baklava to cool completely and absorb the syrup before serving.');

-- Nutrition Info Data for Baklava
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (15, 300, 15, 20, 100, 25, 5);

-- Recipe Data for Strawberry Tart
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (16, 'Strawberry Tart', 'Delicious tart with fresh strawberries and cream cheese', 'Dessert', 30, 20, 8, 4.8, TRUE);

-- Ingredient Data for Strawberry Tart
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(16, 'Pie crust', 1, '9-inch', 'Prepared pie crust', 'Dough'),
(16, 'Fresh strawberries', 2, 'cups', 'Fresh strawberries, hulled and sliced', 'Fruit'),
(16, 'Cream cheese', 8, 'ounces', 'Cream cheese, softened', 'Dairy'),
(16, 'Powdered sugar', 0.5, 'cup', 'Powdered sugar', 'Sweetener'),
(16, 'Vanilla extract', 1, 'teaspoon', 'Vanilla extract', 'Flavoring'),
(16, 'Whipped cream', 1, 'cup', 'Whipped cream', 'Dairy'),
(16, 'Strawberry jam', 0.5, 'cup', 'Strawberry jam', 'Spread');

-- Instruction Data for Strawberry Tart
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(16, 1, 'Preheat oven to 375°F (190°C).'),
(16, 2, 'Press pie crust into a tart pan and bake according to package instructions.'),
(16, 3, 'In a mixing bowl, beat cream cheese, powdered sugar, and vanilla extract until smooth.'),
(16, 4, 'Spread the cream cheese mixture evenly over the cooled tart crust.'),
(16, 5, 'Arrange sliced strawberries on top of the cream cheese layer.'),
(16, 6, 'Heat strawberry jam in a saucepan until melted, then brush over the strawberries.'),
(16, 7, 'Chill the tart in the refrigerator for at least 1 hour to set.'),
(16, 8, 'Before serving, garnish with dollops of whipped cream.');

-- Nutrition Info Data for Strawberry Tart
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (16, 250, 12, 30, 150, 15, 3);



-- Recipe Data for Black Forest Cake
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (17, 'Black Forest Cake', 'Classic chocolate and cherry layer cake', 'Dessert', 45, 60, 10, 4.9, TRUE);

-- Ingredient Data for Black Forest Cake
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(17, 'Chocolate cake', 1, '9-inch round', 'Prepared chocolate cake', 'Cake'),
(17, 'Cherry pie filling', 1, 'can', 'Cherry pie filling', 'Fruit'),
(17, 'Whipped cream', 2, 'cups', 'Whipped cream', 'Dairy'),
(17, 'Dark chocolate shavings', 1, 'cup', 'Dark chocolate shavings', 'Chocolate');

-- Instruction Data for Black Forest Cake
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(17, 1, 'Place one layer of chocolate cake on a serving plate.'),
(17, 2, 'Spread half of the cherry pie filling over the cake layer.'),
(17, 3, 'Top with a layer of whipped cream.'),
(17, 4, 'Repeat with the second layer of chocolate cake, remaining cherry pie filling, and whipped cream.'),
(17, 5, 'Decorate the top with dark chocolate shavings.'),
(17, 6, 'Refrigerate for at least 1 hour before serving.');

-- Nutrition Info Data for Black Forest Cake
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (17, 350, 18, 40, 200, 30, 4);

-- Recipe Data for Maamoul
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (18, 'Maamoul', 'Traditional Middle Eastern filled cookies', 'Dessert', 40, 20, 12, 4.7, TRUE);

-- Ingredient Data for Maamoul
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(18, 'Semolina flour', 2, 'cups', 'Semolina flour', 'Flour'),
(18, 'Butter', 1, 'cup', 'Unsalted butter, melted', 'Dairy'),
(18, 'Date paste', 1, 'cup', 'Date paste', 'Filling'),
(18, 'Ground pistachios', 0.5, 'cup', 'Ground pistachios', 'Filling'),
(18, 'Powdered sugar', 1, 'cup', 'Powdered sugar', 'Sweetener'),
(18, 'Rose water', 2, 'teaspoons', 'Rose water', 'Flavoring');

-- Instruction Data for Maamoul
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(18, 1, 'Preheat oven to 350°F (175°C).'),
(18, 2, 'In a bowl, mix semolina flour and melted butter until crumbly.'),
(18, 3, 'Knead the dough until smooth and let it rest for 30 minutes.'),
(18, 4, 'Divide the dough into small balls and flatten each ball into a disk.'),
(18, 5, 'Place a teaspoon of date paste or ground pistachios in the center of each disk.'),
(18, 6, 'Seal the dough around the filling and shape it using a maamoul mold.'),
(18, 7, 'Place the maamoul on a baking sheet lined with parchment paper.'),
(18, 8, 'Bake for 15-20 minutes or until golden brown.'),
(18, 9, 'Allow the maamoul to cool, then dust with powdered sugar mixed with rose water.');

-- Nutrition Info Data for Maamoul
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (18, 180, 8, 15, 50, 10, 2);

-- Recipe Data for Barazek
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (19, 'Barazek', 'Middle Eastern sesame-pistachio cookies', 'Dessert', 20, 15, 24, 4.9, TRUE);

-- Ingredient Data for Barazek
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(19, 'Flour', 2, 'cups', 'All-purpose flour', 'Flour'),
(19, 'Butter', 1, 'cup', 'Butter, softened', 'Dairy'),
(17, 'Sugar', 0.5, 'cup', 'Granulated sugar', 'Sweetener'),
(19, 'Sesame seeds', 0.5, 'cup', 'Toasted sesame seeds', 'Nut'),
(19, 'Pistachios', 0.25, 'cup', 'Chopped pistachios', 'Nut'),
(19, 'Baking powder', 1, 'teaspoon', 'Baking powder', 'Leavening agent'),
(19, 'Water', 2, 'tablespoons', 'Water', 'Liquid');

-- Instruction Data for Barazek
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(19, 1, 'Preheat oven to 350°F (175°C) and line a baking sheet with parchment paper.'),
(19, 2, 'In a bowl, cream together softened butter and granulated sugar until light and fluffy.'),
(19, 3, 'Add flour and baking powder to the butter mixture and mix until combined.'),
(19, 4, 'Divide the dough into small balls and flatten them slightly on the prepared baking sheet.'),
(19, 5, 'Mix together sesame seeds and chopped pistachios.'),
(19, 6, 'Brush the flattened dough with water and press them into the sesame-pistachio mixture.'),
(19, 7, 'Bake in the preheated oven for 12-15 minutes, or until golden brown around the edges.'),
(19, 8, 'Allow Barazek to cool on the baking sheet before serving.');

-- Nutrition Info Data for Barazek
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (19, 150, 8, 20, 80, 8, 2);

-- Recipe Data for Kaak
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (20, 'Kaak', 'Traditional Middle Eastern bread rings with sesame and anise seeds', 'Dessert', 60, 20, 12, 4.6, TRUE);

-- Ingredient Data for Kaak
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(20, 'Flour', 3, 'cups', 'All-purpose flour', 'Flour'),
(20, 'Sugar', 0.5, 'cup', 'Granulated sugar', 'Sweetener'),
(20, 'Butter', 0.5, 'cup', 'Butter, softened', 'Dairy'),
(20, 'Milk', 1, 'cup', 'Milk', 'Liquid'),
(20, 'Yeast', 1, 'packet', 'Active dry yeast', 'Leavening agent'),
(20, 'Sesame seeds', 0.25, 'cup', 'Toasted sesame seeds', 'Nut'),
(20, 'Anise seeds', 2, 'tablespoons', 'Anise seeds', 'Spice');

-- Instruction Data for Kaak
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(20, 1, 'In a bowl, dissolve yeast in warm milk with a pinch of sugar and let it activate for 5 minutes.'),
(20, 2, 'In a separate bowl, cream together softened butter and granulated sugar until light and fluffy.'),
(20, 3, 'Add the activated yeast mixture to the butter-sugar mixture and mix well.'),
(20, 4, 'Gradually add flour to the wet ingredients and knead until a smooth dough forms.'),
(20, 5, 'Cover the dough and let it rise in a warm place for about 1 hour or until doubled in size.'),
(20, 6, 'Preheat oven to 350°F (175°C) and line a baking sheet with parchment paper.'),
(20, 7, 'Divide the dough into small balls and roll each ball into a rope shape.'),
(20, 8, 'Twist each rope into a ring shape and press the ends to seal.'),
(20, 9, 'Brush the kaak rings with water and sprinkle sesame seeds and anise seeds on top.'),
(20, 10, 'Place the kaak rings on the prepared baking sheet and bake for 15-20 minutes until golden brown.'),
(20, 11, 'Allow Kaak to cool on a wire rack before serving.');

-- Nutrition Info Data for Kaak
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (20, 180, 8, 15, 100, 8, 3);


-- Recipe Data for Donut
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (21, 'Classic Donut', 'Fluffy and sweet donuts with a glaze topping', 'Dessert', 20, 15, 12, 4.8, TRUE);

-- Ingredient Data for Donut
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES
(21, 'Flour', 2.5, 'cups', 'All-purpose flour', 'Flour'),
(21, 'Sugar', 0.5, 'cup', 'Granulated sugar', 'Sweetener'),
(21, 'Milk', 1, 'cup', 'Warm milk', 'Liquid'),
(21, 'Butter', 0.25, 'cup', 'Unsalted butter, melted', 'Dairy'),
(21, 'Egg', 1, 'large', 'Large egg', 'Dairy'),
(21, 'Yeast', 1, 'packet', 'Active dry yeast', 'Leavening agent'),
(21, 'Salt', 0.5, 'teaspoon', 'Salt', 'Seasoning'),
(21, 'Oil', 4, 'cups', 'Vegetable oil for frying', 'Cooking oil'),
(21, 'Powdered sugar', 1, 'cup', 'Powdered sugar for glaze', 'Sweetener'),
(21, 'Vanilla extract', 1, 'teaspoon', 'Vanilla extract for glaze', 'Flavoring'),
(21, 'Water', 2, 'tablespoons', 'Water for glaze', 'Liquid');

-- Instruction Data for Donut
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES
(21, 1, 'In a small bowl, dissolve yeast in warm milk with a pinch of sugar. Let it sit for 5-10 minutes until foamy.'),
(21, 2, 'In a large bowl, combine flour, sugar, and salt.'),
(21, 3, 'Add the yeast mixture, melted butter, and egg to the dry ingredients. Mix until a soft dough forms.'),
(21, 4, 'Knead the dough on a floured surface for about 5 minutes, until smooth and elastic.'),
(21, 5, 'Place the dough in a greased bowl, cover, and let it rise in a warm place for 1 hour or until doubled in size.'),
(21, 6, 'Roll out the dough to about 1/2 inch thick and cut out donuts using a donut cutter or two round cutters.'),
(21, 7, 'Heat vegetable oil in a deep fryer or large pot to 350°F (175°C).'),
(21, 8, 'Fry the donuts in batches, turning them once, until golden brown (about 1-2 minutes per side).'),
(21, 9, 'Remove donuts and drain on paper towels.'),
(21, 10, 'For the glaze, whisk together powdered sugar, vanilla extract, and water until smooth.'),
(21, 11, 'Dip the warm donuts into the glaze and let them set on a wire rack.'),
(21, 12, 'Serve fresh and enjoy!');

-- Nutrition Info Data for Donut
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (21, 250, 5, 30, 150, 1, 12);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (22, 'Negroni', 'Classic Italian cocktail with gin, Campari, and vermouth', 'Drink', 5, 0, 1, 4.9, TRUE);

-- Ingredient Data for Negroni
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(22, 'Gin', 1, 'oz', 'Dry gin', 'Alcohol'),
(22, 'Campari', 1, 'oz', 'Bitter liqueur', 'Alcohol'),
(22, 'Sweet Vermouth', 1, 'oz', 'Red sweet vermouth', 'Alcohol'),
(22, 'Orange peel', 1, 'piece', 'For garnish', 'Garnish'),
(22, 'Ice', 1, 'cup', 'Cubed ice for chilling', 'Miscellaneous');

-- Instruction Data for Negroni
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(22, 1, 'Fill a mixing glass with ice.'),
(22, 2, 'Add gin, Campari, and sweet vermouth.'),
(22, 3, 'Stir well until the mixture is chilled.'),
(22, 4, 'Strain into a rocks glass filled with fresh ice.'),
(22, 5, 'Garnish with an orange peel and serve.');

-- Nutrition Info Data for Negroni
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (22, 190, 0, 7, 5, 0, 0);

-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (23, 'Paloma', 'Refreshing Mexican cocktail made with tequila, grapefruit soda, and lime', 'Drink', 5, 0, 1, 4.8, TRUE);

-- Ingredient Data for Paloma
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(23, 'Tequila', 2, 'oz', 'Blanco or silver tequila', 'Alcohol'),
(23, 'Grapefruit soda', 4, 'oz', 'Chilled grapefruit soda', 'Mixer'),
(23, 'Lime juice', 0.5, 'oz', 'Freshly squeezed lime juice', 'Fruit juice'),
(23, 'Salt', 1, 'pinch', 'For rimming the glass (optional)', 'Seasoning'),
(23, 'Ice', 1, 'cup', 'Cubed ice for serving', 'Miscellaneous'),
(23, 'Grapefruit wedge', 1, 'piece', 'For garnish', 'Garnish'),
(23, 'Lime wedge', 1, 'piece', 'For garnish', 'Garnish');

-- Instruction Data for Paloma
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(23, 1, 'Optional: Rim the glass with salt by rubbing the rim with a lime wedge and dipping it into salt.'),
(23, 2, 'Fill the glass with ice.'),
(23, 3, 'Add tequila and lime juice.'),
(23, 4, 'Top with grapefruit soda and gently stir to combine.'),
(23, 5, 'Garnish with a grapefruit wedge or lime wedge and serve.');

-- Nutrition Info Data for Paloma
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (23, 170, 0, 16, 25, 0, 0);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (24, 'Dirty Martini', 'Classic cocktail with gin, dry vermouth, and olive brine for a savory twist', 'Drink', 5, 0, 1, 4.7, TRUE);

-- Ingredient Data for Dirty Martini
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(24, 'Gin', 2.5, 'oz', 'Dry gin', 'Alcohol'),
(24, 'Dry Vermouth', 0.5, 'oz', 'Dry vermouth', 'Alcohol'),
(24, 'Olive brine', 0.5, 'oz', 'Brine from a jar of green olives', 'Miscellaneous'),
(24, 'Ice', 1, 'cup', 'Cubed ice for chilling', 'Miscellaneous'),
(24, 'Green olives', 2, 'pieces', 'For garnish', 'Garnish');

-- Instruction Data for Dirty Martini
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(24, 1, 'Fill a mixing glass with ice.'),
(24, 2, 'Add gin, dry vermouth, and olive brine.'),
(24, 3, 'Stir well until the mixture is thoroughly chilled.'),
(24, 4, 'Strain into a chilled martini glass.'),
(24, 5, 'Garnish with green olives and serve.');

-- Nutrition Info Data for Dirty Martini
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (24, 200, 0, 1, 500, 0, 0);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (25, 'Whiskey Sour', 'Classic cocktail with whiskey, lemon juice, and simple syrup', 'Drink', 5, 0, 1, 4.8, TRUE);

-- Ingredient Data for Whiskey Sour
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(25, 'Whiskey', 2, 'oz', 'Bourbon or rye whiskey', 'Alcohol'),
(25, 'Lemon juice', 1, 'oz', 'Freshly squeezed lemon juice', 'Fruit juice'),
(25, 'Simple syrup', 0.5, 'oz', 'Equal parts sugar and water, combined', 'Sweetener'),
(25, 'Egg white', 1, 'unit', 'Optional, for a frothy texture', 'Miscellaneous'),
(25, 'Ice', 1, 'cup', 'Cubed ice for shaking', 'Miscellaneous'),
(25, 'Angostura bitters', 2, 'dashes', 'Optional, for garnish', 'Miscellaneous'),
(25, 'Orange slice', 1, 'piece', 'Optional, for garnish', 'Garnish'),
(25, 'Cherry', 1, 'piece', 'Optional, for garnish', 'Garnish');

-- Instruction Data for Whiskey Sour
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(25, 1, 'Fill a shaker with ice.'),
(25, 2, 'Add whiskey, lemon juice, and simple syrup.'),
(25, 3, 'If using, add the egg white to the shaker.'),
(25, 4, 'Shake vigorously for about 15 seconds to chill and combine ingredients.'),
(25, 5, 'Strain into a rocks glass filled with fresh ice.'),
(25, 6, 'Optional: Add a dash of Angostura bitters on top.'),
(25, 7, 'Garnish with an orange slice and a cherry, then serve.');

-- Nutrition Info Data for Whiskey Sour
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (25, 170, 3, 10, 5, 0, 0);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (26, 'Strawberry Daiquiri', 'A refreshing frozen cocktail made with strawberries, rum, and lime juice', 'Drink', 10, 0, 1, 4.9, TRUE);

-- Ingredient Data for Strawberry Daiquiri
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(26, 'Strawberries', 1, 'cup', 'Fresh or frozen strawberries', 'Fruit'),
(26, 'White rum', 2, 'oz', 'Light white rum', 'Alcohol'),
(26, 'Lime juice', 1, 'oz', 'Freshly squeezed lime juice', 'Fruit juice'),
(26, 'Simple syrup', 1, 'oz', 'Equal parts sugar and water, combined', 'Sweetener'),
(26, 'Ice', 1, 'cup', 'Crushed ice for blending', 'Miscellaneous'),
(26, 'Strawberry', 1, 'piece', 'Optional, for garnish', 'Garnish');

-- Instruction Data for Strawberry Daiquiri
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(26, 1, 'Add strawberries, white rum, lime juice, simple syrup, and ice to a blender.'),
(26, 2, 'Blend until smooth and slushy.'),
(26, 3, 'Pour into a chilled cocktail glass.'),
(26, 4, 'Optional: Garnish with a whole strawberry on the rim and serve.');

-- Nutrition Info Data for Strawberry Daiquiri
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (26, 180, 0, 22, 5, 3, 0);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (27, 'Old Fashioned', 'Classic whiskey cocktail with sugar, bitters, and an orange twist', 'Drink', 5, 0, 1, 4.9, TRUE);

-- Ingredient Data for Old Fashioned
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(27, 'Whiskey', 2, 'oz', 'Bourbon or rye whiskey', 'Alcohol'),
(27, 'Sugar cube', 1, 'unit', 'Classic sugar cube', 'Sweetener'),
(27, 'Angostura bitters', 2, 'dashes', 'Aromatic bitters', 'Miscellaneous'),
(27, 'Orange peel', 1, 'piece', 'For garnish', 'Garnish'),
(27, 'Ice', 1, 'large cube', 'Large ice cube for serving', 'Miscellaneous'),
(27, 'Water', 1, 'teaspoon', 'Optional, to dissolve sugar', 'Miscellaneous');

-- Instruction Data for Old Fashioned
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(27, 1, 'Place the sugar cube in a rocks glass.'),
(27, 2, 'Add dashes of Angostura bitters onto the sugar cube.'),
(27, 3, 'Muddle the sugar cube with a splash of water until dissolved.'),
(27, 4, 'Fill the glass with a large ice cube or several smaller cubes.'),
(27, 5, 'Pour the whiskey over the ice and gently stir.'),
(27, 6, 'Garnish with an orange peel, twisting it over the drink to release the oils before placing it in the glass.');

-- Nutrition Info Data for Old Fashioned
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (27, 150, 0, 4, 0, 0, 0);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (28, 'White Russian', 'Creamy cocktail made with vodka, coffee liqueur, and cream', 'Drink', 5, 0, 1, 4.7, TRUE);

-- Ingredient Data for White Russian
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(28, 'Vodka', 2, 'oz', 'High-quality vodka', 'Alcohol'),
(28, 'Coffee liqueur', 1, 'oz', 'Classic coffee liqueur like Kahlúa', 'Alcohol'),
(28, 'Heavy cream', 1, 'oz', 'Heavy cream or milk for a lighter option', 'Dairy'),
(28, 'Ice', 1, 'cup', 'Cubed ice for serving', 'Miscellaneous');

-- Instruction Data for White Russian
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(28, 1, 'Fill a rocks glass with ice.'),
(28, 2, 'Pour vodka and coffee liqueur over the ice.'),
(28, 3, 'Top with heavy cream and stir gently to combine.'),
(28, 4, 'Serve immediately.');

-- Nutrition Info Data for White Russian
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (28, 325, 1, 11, 10, 0, 17);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (29, 'Cosmopolitan', 'Trendy and elegant cocktail made with vodka, cranberry juice, and lime', 'Drink', 5, 0, 1, 4.8, TRUE);

-- Ingredient Data for Cosmopolitan
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(29, 'Vodka', 1.5, 'oz', 'High-quality vodka', 'Alcohol'),
(29, 'Triple Sec', 1, 'oz', 'Orange-flavored liqueur like Cointreau', 'Alcohol'),
(29, 'Cranberry juice', 0.5, 'oz', 'Unsweetened cranberry juice', 'Juice'),
(29, 'Lime juice', 0.25, 'oz', 'Freshly squeezed lime juice', 'Juice'),
(29, 'Ice', 1, 'cup', 'Cubed ice for shaking', 'Miscellaneous'),
(29, 'Orange peel', 1, 'piece', 'Optional, for garnish', 'Garnish');

-- Instruction Data for Cosmopolitan
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(29, 1, 'Fill a cocktail shaker with ice.'),
(29, 2, 'Add vodka, triple sec, cranberry juice, and lime juice.'),
(29, 3, 'Shake vigorously until chilled.'),
(29, 4, 'Strain into a chilled martini glass.'),
(29, 5, 'Optional: Garnish with an orange peel or lime wedge and serve.');

-- Nutrition Info Data for Cosmopolitan
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (29, 150, 0, 8, 1, 0, 0);


-- Recipe Data
INSERT INTO Recipe (recipe_id, name, description, category, prep_time, cook_time, servings, rating, vegetarian)
VALUES (30, 'Daiquiri', 'A classic rum cocktail with lime and simple syrup', 'Drink', 5, 0, 1, 4.9, TRUE);

-- Ingredient Data for Daiquiri
INSERT INTO Ingredient (recipe_id, name, quantity, unit, description, category)
VALUES 
(30, 'White rum', 2, 'oz', 'Light white rum', 'Alcohol'),
(30, 'Lime juice', 1, 'oz', 'Freshly squeezed lime juice', 'Juice'),
(30, 'Simple syrup', 0.5, 'oz', 'Equal parts sugar and water, combined', 'Sweetener'),
(30, 'Ice', 1, 'cup', 'Cubed ice for shaking', 'Miscellaneous'),
(30, 'Lime wheel', 1, 'piece', 'Optional, for garnish', 'Garnish');

-- Instruction Data for Daiquiri
INSERT INTO Instruction (recipe_id, step_number, instruction_text)
VALUES 
(30, 1, 'Fill a cocktail shaker with ice.'),
(30, 2, 'Add white rum, lime juice, and simple syrup.'),
(30, 3, 'Shake vigorously until well-chilled.'),
(30, 4, 'Strain into a chilled coupe or martini glass.'),
(30, 5, 'Optional: Garnish with a lime wheel and serve.');

-- Nutrition Info Data for Daiquiri
INSERT INTO NutritionInfo (recipe_id, calories, protein, carbs, sodium, fiber, fat)
VALUES (30, 170, 0, 9, 3, 0, 0);




