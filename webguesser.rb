
require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(100)
  get '/' do
    guess = params["guess"].to_i
    message, color = check_guess(guess)
    erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
  end


  def check_guess(guess)
    if guess > SECRET_NUMBER
      high_guess(guess)
    elsif guess < SECRET_NUMBER
      low_guess(guess)
    else
      message = "You won, yay!\n The secret number is #{SECRET_NUMBER}", color = "green"
    end
  end

  def high_guess(guess)
    if guess - SECRET_NUMBER > 5
      message = "Way too high!", color = "red"
    else
      message = "Too high!", color = "pink"
    end
  end

  def low_guess(guess)
    if SECRET_NUMBER - guess > 5
      message = "Way too low!", color = "blue"
    else
      message = "Too low!", color = "#00afa9"
    end
  end
