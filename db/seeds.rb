User.create(username: "william", password: "password", email: "william@test.com", bio: "test test 1 2 3")
User.create(username: "teddy", password: "password1", email: "teddy@test.com", bio: "one more test")
Category.create(name: "Breakfast")
Category.create(name: "Lunch")
r = Recipe.new(name: "Healthy Serving of Bacon", ingredients: "Bacon", serving_size: 1, cook_time: "About 15-20 min", directions: "Cook, then stuff your face")
r.user = User.first
r.category = Category.first
r.save
r1 = Recipe.new(name: "Mangu", ingredients: "Plaintains, onions, salt", serving_size: 1, cook_time: "About 30 min", directions: "Boil with salt, mash, cook onions, put onions on top.")
r1.user = User.last
r1.category = Category.first
r1.save
r2 = Recipe.new(name: "Tuna Sammich", ingredients: "Wheat bread, tuna, onions, mayo, guacamole, cheese, salt, pepper, pickles", serving_size: 1, cook_time: "About 5-15 minutes, depending on if you're trying to take a picture for instagram", directions: "Put drained tuna in bowl, cut onions and put inside, put mayo inside, swish it around, lay cheese on one slice, mash guac on the other side, lay equal portions of tuna, salt and pepper, toast until the cheese is melty, put slices together and eat.")
r2.user = User.first
r2.category = Category.last
r2.save