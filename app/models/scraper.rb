require 'open-uri'
require 'nokogiri'

class Scraper
  attr_accessor :url_middle, :url_begin, :url_end, :ingredients
  attr_reader :food_network_url

  def initialize(ingredients)
    @ingredients = ingredients
  end

  def scrape_food_network
    @url_begin = "http://www.foodnetwork.com/search/search-results.recipes.html?searchTerm="
    @url_end = "&form=global&_charset_=UTF-8"
    doc = Nokogiri::HTML(open(search_url))

    doc.css("article.recipe").each do |r|
      recipe_url = food_network_url+r.css("h6 a").attr("href").value
      recipe_doc = Nokogiri::HTML(open(recipe_url))
      recipe = Recipe.new

      recipe.name = recipe_doc.css("h1").text

      #entering ingredients
      ingredients = []
      recipe_doc.css("div.col8.ingredients li").each do |i|
        ingredients << i.text.strip
      end

      #joining like this for easier splitting later on
      recipe.ingredients = ingredients.join("*-*-*")
      recipe.serving_size = recipe_doc.css("div.difficulty dd").first.text
      recipe.cook_time = recipe_doc.css("dd.total").first.text

      #joining directions properly
      directions = []
      recipe_doc.css("ul.recipe-directions-list li").each do |t|
        directions << t.text.strip
      end
      recipe.directions = directions.join(" ")
      recipe.category = Category.find_or_create_by(name: "Unlabeled")
      recipe.user = User.find_or_create_by(username: "Food Network Scraper")

      if recipe.directions.empty?
        recipe.directions = "Sorry, no directions available."
      end
      recipe.directions << "\n Recipe Url: #{food_network_url+r.css("h6 a").attr("href").value}"
      recipe.save
    end
  end

  def search_url
    @url_middle = ingredients.join("+")    
    full = @url_begin+@url_middle+@url_end
    full
  end

  def food_network_url
    "http://www.foodnetwork.com"
  end





end