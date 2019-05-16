class GamesController < ApplicationController
  LETTERS = ('a'..'z').to_a.sample(10)

  def new
    @letters = LETTERS
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    while LETTERS.each { |letter| params[:word].include?(letter) }
      if url['found'] == 'false'
      @score = "Sorry but #{params[:word].upcase} doesn't seem to be an English word..."
      elsif url['found'] == 'true'
      @score = "Congratulations! #{params[:word].upcase} is a valid English word!"
      end
    end
    @score = "Sorry but #{params[:word].upcase} can't be built out of #{LETTERS.join.upcase}."
  end
end
