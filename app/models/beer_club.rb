class BeerClub < ActiveRecord::Base
  has_many :memberships
  has_many :members, -> { uniq }, through: :memberships, source: :user

  def to_s
  "#{self.name}"
  end
end