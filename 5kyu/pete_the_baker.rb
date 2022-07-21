# Description:

# Pete likes to bake some cakes. He has some recipes and ingredients. 
# Unfortunately he is not good in maths. Can you help him to find out, 
# how many cakes he could bake considering his recipes?

# Write a function cakes(), which takes the recipe (object) and the 
# available ingredients (also an object) and returns the maximum number 
# of cakes Pete can bake (integer). For simplicity there are no units 
# for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 
# 200). Ingredients that are not present in the objects, can be 
# considered as 0.

# Examples:

# // must return 2
# cakes({flour: 500, sugar: 200, eggs: 1}, 
#     {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
# // must return 0
# cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, 
#     {sugar: 500, flour: 2000, milk: 2000}); 
def cakes(recipe, available)
    if recipe.keys.all? {|ing| available.keys.include?(ing)} 
      max_number = nil;
      recipe.each do |ingredient,amount|
        possible = available[ingredient] / amount
        max_number = [possible, (max_number.nil? ? 22 : max_number)].min
      end
      max_number
    else 
      0
    end
end
  
# the basic
recipe.collect { | k, v | available[k].to_i / v }.min

available.default = 0
recipe.map { |k,v| available[k] / v }.min

# cheap rescues
recipe.keys.map{|k| available[k].to_f/recipe[k] rescue 0}.min.floor

available[key] / recipe[key] rescue NilClass and return 0 

#
r.map{|k,v|(a[k]||0)/v}.min

#
recipe.map do |k, v|
    available.fetch(k, 0) / v
end.min.to_i

#
possible = []
  recipe.each do |ingredient, amount|
    if available.has_key?(ingredient)
      possible << available[ingredient] / amount
    else
      possible = [0]
    end 
  end
possible.min
