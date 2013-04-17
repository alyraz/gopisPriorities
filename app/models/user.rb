class User < ActiveRecord::Base
  attr_accessible :name, :photo_src, :google_id
end
