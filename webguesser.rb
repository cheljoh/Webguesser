
require 'sinatra'
require 'sinatra/reloader'


SECRET_NUMBER = rand(100)
  get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)
    erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :color => color}
  end

  def check_guess(guess)
    if guess > number
      if guess - number > 5
        color = "red"
        message = "Way too high!"
      else
        color = "pink"
        message = "Too high!"
      end
    elsif guess < number
      if number - guess > 5
        color = "blue"
        message = "Way too low!"
      else
        color = "#00afa9"
        message = "Too low!"
      end
    else
      message = "You won, yay!\n The secret number is #{number}"
      color = "green"
    end
  end
