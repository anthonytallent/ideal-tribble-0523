require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :actors}
  end

  it 'can order all of its actors by age' do
    @universal = Studio.create!(name: "Universal Studios", location: "LA")
    @limo = Studio.create!(name: "Limo Productions", location: "Glendale")

    @mummy = @universal.movies.create!(title: "The Mummy", creation_year: "1999", genre: "Action")
    @legally_blonde = @universal.movies.create!(title: "Legally Blonde", creation_year: "2000", genre: "comedy")
    @the_grinch = @limo.movies.create!(title: "The Grinch", creation_year: "2001", genre: "Holiday")

    @jim = @the_grinch.actors.create!(name: "Jim Carrey", age: "30")
    @reese = @legally_blonde.actors.create!(name: "Reese Witherspoon", age: "32")
    @brendan = @mummy.actors.create!(name: "Brendan Frazier", age: "33")
    @cindy = @the_grinch.actors.create!(name: "Cindy Lou-Who", age: "8")
    
    expect(@the_grinch.actors_youngest_to_oldest).to eq([@cindy, @jim])
  end

  it 'can calculate the actors average age' do
    @universal = Studio.create!(name: "Universal Studios", location: "LA")
    @limo = Studio.create!(name: "Limo Productions", location: "Glendale")

    @mummy = @universal.movies.create!(title: "The Mummy", creation_year: "1999", genre: "Action")
    @legally_blonde = @universal.movies.create!(title: "Legally Blonde", creation_year: "2000", genre: "comedy")
    @the_grinch = @limo.movies.create!(title: "The Grinch", creation_year: "2001", genre: "Holiday")

    @jim = @the_grinch.actors.create!(name: "Jim Carrey", age: "30")
    @reese = @legally_blonde.actors.create!(name: "Reese Witherspoon", age: "32")
    @brendan = @mummy.actors.create!(name: "Brendan Frazier", age: "33")
    @cindy = @the_grinch.actors.create!(name: "Cindy Lou-Who", age: "8")

    expect(@the_grinch.actors_average_age).to eq(19.0)
  end
end
