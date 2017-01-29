class Brewery < ActiveRecord::Base
  include RatingAverage

has_many :beers, dependent: :destroy
has_many :ratings, through: :beers

def print_report
  puts name
  puts "established at year #{year}"
  puts "number of beers #{beers.count}"
end

def rrestart
  self.year = 2017
  puts "changed year to #{year}"
end

def to_s
  "#{self.name}"
end

end
