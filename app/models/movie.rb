class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  def actors_youngest_to_oldest
    # binding.pry
    actors.order(age: :desc)
  end
end
