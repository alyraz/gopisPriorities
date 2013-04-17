class CheckinsController < ApplicationController

  def new
    @priorities = Checkin.attribute_names.reject{|i| ['id', 'created_at', 'updated_at', 'user_id'].include?(i)}
  end

end
