# app.rb

require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:homepage)
end

get("/:move") do
  moves = ["rock", "paper", "scissors"]
  @user_move = params[:move]

  unless moves.include?(@user_move)
    redirect to("/")
  end

  @comp_move = moves.sample

  if @user_move == @comp_move
    @outcome = "tied"
  elsif (@user_move == "rock" && @comp_move == "scissors") ||
         (@user_move == "paper" && @comp_move == "rock") ||
         (@user_move == "scissors" && @comp_move == "paper")
    @outcome = "won"
  else
    @outcome = "lost"
  end

  erb(:we_play)
end
