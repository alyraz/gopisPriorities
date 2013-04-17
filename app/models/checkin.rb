class Checkin < ActiveRecord::Base
  attr_accessible :user_id, :sleep, :nutrition, :exercise, :meditation, :love, :stuff, :work, :passion, :growth, :service
  belongs_to :user
end
