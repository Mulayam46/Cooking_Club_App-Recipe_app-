class Recipe {
  final String title;
  final String photo;
  final String ingredients;
  final String instructions;

  Recipe({
    required this.title,
    required this.photo,
    required this.ingredients,
    required this.instructions,
  });
}

// Mock data for recipes
List<Recipe> getRecipes() {
  return [
    Recipe(
      title: 'Spaghetti Carbonara',
      photo: 'assets/Spaghetti.jpg',
      ingredients: 'Spaghetti, Eggs, Pecorino Romano, Guanciale, Black Pepper',
      instructions: 'Boil pasta. Cook guanciale. Mix eggs and cheese. Combine all.',
    ),
    Recipe(
      title: 'Chicken Curry',
      photo: 'assets/chickencurry.jpg',
      ingredients: 'Chicken, Curry Powder, Coconut Milk, Onion, Garlic, Ginger',
      instructions: 'Cook onion, garlic, and ginger. Add chicken and curry powder. Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Burgers',
      photo: 'assets/burger.jpg',
      ingredients: 'Pow,  Coconut Milk, Onion, Garlic, Ginger',
      instructions: 'Cook onion, garlic, and ginger. Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Sandwich',
      photo: 'assets/sandwich.jpg',
      ingredients: 'Bread,Potato, Onion, Garlic, Ginger',
      instructions: 'Cook ,toast, garlic, and ginger. Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Whopper',
      photo: 'assets/whopper.jpg',
      ingredients: 'Pov, Potato, Coconut Milk, Onion, Garlic, Ginger',
      instructions: 'Cook ,Toast, garlic, and ginger.  Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Pizzavariant',
      photo: 'assets/recipe1.jpg',
      ingredients: 'Pizza, Coconut Milk, Onion, Garlic, Ginger',
      instructions: 'Cook onion, garlic, and ginger. Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Maggi/Noodles',
      photo: 'assets/maggi.jpg',
      ingredients: 'Maggi,water, Onion, Garlic, Ginger',
      instructions: 'Cook onion, garlic, and ginger.  Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Egg Curry',
      photo: 'assets/egg.jpg',
      ingredients: 'Egg, Curry Powder, Coconut Milk, Onion, Garlic, Ginger',
      instructions: 'Cook onion, garlic, and ginger. Add Egg and curry powder. Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Fish Curry',
      photo: 'assets/fish.jpg',
      ingredients: 'Fish, Curry Powder, Coconut Milk, Onion, Garlic, Ginger',
      instructions: 'Cook onion, garlic, and ginger. Add coconut milk and simmer.',
    ),
    Recipe(
      title: 'Kheer',
      photo: 'assets/kheer.jpg',
      ingredients: ' Milk, Sugar, DryFruit',
      instructions: 'Cook  Add coconut milk and simmer.',
    ),
  ];
}
