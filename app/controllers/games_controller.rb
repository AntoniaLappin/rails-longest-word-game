require 'open-uri'
require 'json'
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @myscore = params['score']
    url = "https://wagon-dictionary.herokuapp.com/#{@myscore}"
    user_serialized = URI.open(url).read
    @valid_english = JSON.parse(user_serialized)

    # check if word is in grid and return true or false
    @score_array = @myscore.split("") # string to array


        if @valid_english['found']
          @score_array.each do |scoreletter| # iteration for array of characters
            if params['letters'].exclude?(scoreletter)
              @response = "wrong word"
              @score = 0
              break
            end
          end
          @response = "nice one" unless @response == "wrong word"
          @score = 1
        else
          @response = "word does not exist"
          @score = 0
        end

    # if @valid_english['found'] && @myscore == # variable
      # return score
    # elsif

    # else


    # end
  end
end
