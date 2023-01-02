class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  def actors_youngest_to_oldest
    actors.order(age: :desc)
  end

  def actors_average_age
    # binding.pry
    ages_sum = 0
    ages = actors.pluck(:age)
    ages.each do |age|
      ages_sum += age.to_i
    end
    average_age = ages_sum / ages.count
  end
end
