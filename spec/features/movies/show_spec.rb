require 'rails_helper'

RSpec.describe 'show' do
  before(:each) do
    @universal = Studio.create!(name: "Universal Studios", location: "LA")
    @limo = Studio.create!(name: "Limo Productions", location: "Glendale")

    @mummy = @universal.movies.create!(title: "The Mummy", creation_year: "1999", genre: "Action")
    @legally_blonde = @universal.movies.create!(title: "Legally Blonde", creation_year: "2000", genre: "comedy")
    @the_grinch = @limo.movies.create!(title: "The Grinch", creation_year: "2001", genre: "Holiday")

    @jim = @the_grinch.actors.create!(name: "Jim Carrey", age: "30")
    @reese = @legally_blonde.actors.create!(name: "Reese Witherspoon", age: "32")
    @brendan = @mummy.actors.create!(name: "Brendan Frazier", age: "33")
    @cindy = @the_grinch.actors.create!(name: "Cindy Lou-Who", age: "8")
  end

  it 'will show a movies title, creation year and genre' do
    visit "/movies/#{@the_grinch.id}"

    expect(page).to have_content(@the_grinch.title)
    expect(page).to have_content(@the_grinch.creation_year)
    expect(page).to have_content(@the_grinch.genre)
    expect(page).to_not have_content(@mummy.title)
    expect(page).to_not have_content(@mummy.creation_year)
    expect(page).to_not have_content(@mummy.genre)
  end

  it 'will list all actors from youngest to oldest' do
    visit "/movies/#{@the_grinch.id}"

    expect(@cindy.name).to appear_before(@jim.name)
  end
end