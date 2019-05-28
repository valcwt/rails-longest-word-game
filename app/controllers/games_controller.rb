require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { (65 + rand(26)).chr }
  end

  def score
    @word = params[:word]
    @letters = params[:letters]

       @word_valid_english = english_word?(@word)

      if @word_valid_english == true
       return "Is a valid English word"
      else
      "does not seem to be a valid English word.."
      end
  end
end

  private

def english_word?(word)
  response = "https://wagon-dictionary.herokuapp.com/#{word.upcase}"
  result = open(response).read
  return  JSON.parse(result) ['found']

end

