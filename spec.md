Specifications for the Rails Assessment

Specs:

 __ Using Ruby on Rails for the project
 __ Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
 __ Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
 __ Include at least one has_many through relationship (x has_many y through z e.g. Recipe
    has_many Items through Ingredients) The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
 __ Include reasonable validations for simple model objects (list of model objects with
    validations e.g. User, Recipe, Ingredient, Item)
 __ Include a class level ActiveRecord scope method (model object & class method name and URL to
    see the working feature e.g. User.most_recipes URL: /users/most_recipes)
 __ Include a nested form writing to an associated model using a custom attribute writer
    (form URL, model name e.g. /recipe/new, Item)
 __ Include signup (how e.g. Devise)
 __ Include login (how e.g. Devise)
 __ Include logout (how e.g. Devise)
 __ Include third party signup/login (how e.g. Devise/OmniAuth)
 __ Include nested resource show or index (URL e.g. users/2/recipes)
 __ Include nested resource "new" form (URL e.g. recipes/1/ingredients)
 __ Include form display of validation errors (form URL e.g. /recipes/new)

    Confirm:

__   The application is pretty DRY
__   Limited logic in controllers
__   Views use helper methods if appropriate
__   Views use partials if appropriate
