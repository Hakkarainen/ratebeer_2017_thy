class User < ActiveRecord::Base
    include RatingAverage
    has_secure_password

    validates :username, uniqueness: true
    validates :username, length: { minimum: 3 }
    validates :username, length: { maximum: 30 }

    validates :password, length: { minimum: 4 },
              format: {
                  with: /\d.*[A-Z]|[A-Z].*\d/,
                  message: "Enter at least one number and one upper case letter, please !"
              }
    has_many :ratings, dependent: :destroy
    has_many :memberships, dependent: :destroy
    has_many :beers, through: :ratings
    has_many :clubs, -> { uniq }, through: :memberships, source: :beer_club
end
