class CheckinsController < ApplicationController

  def new
    puts session[:user_id].inspect
  end

end
