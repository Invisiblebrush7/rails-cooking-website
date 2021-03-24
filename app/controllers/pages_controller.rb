require "json"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    # response = RestClient.get "https://api.spoonacular.com/recipes/complexSearch?apiKey=6bd53aadf4834e768b6ff6cfc05d7e63&query=pasta"
    # @recipes = JSON.parse(response)
  end
end
