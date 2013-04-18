class CheckinsController < ApplicationController

  def new
    @priorities = Checkin.attribute_names.reject{|i| ['id', 'created_at', 'updated_at', 'user_id'].include?(i)}
  end

  def create
    if session[:user_id]
      params[:user_id] = session[:user_id]
      ['action', 'controller'].each do |key|
        params.delete(key)
      end
      Checkin.create params
      redirect_to checkins_path
    else
      flash[:notice] = "Please signin with Google"
      redirect_to new_checkin_path
    end
  end

  def index
    @checkins = Checkin.where(:user_id => session[:user_id])
  end
end
