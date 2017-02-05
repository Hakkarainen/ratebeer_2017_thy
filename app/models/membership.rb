class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer_club

  def to_s
    "#{user.username} #{beer_club.name}"
  end
end
