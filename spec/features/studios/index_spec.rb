require 'rails_helper'

RSpec.describe "index" do
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
  it 'lists all studios and their name and location' do
    visit '/studios/index'

    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@limo.name)
    expect(page).to have_content(@universal.location)
    expect(page).to have_content(@limo.location)
  end

  it 'lists all the studios movies and the movies attributes' do
    visit '/studios/index'

    expect(page).to have_content(@mummy.title)
    expect(page).to have_content(@mummy.creation_year)
    expect(page).to have_content(@mummy.genre)
    expect(page).to have_content(@legally_blonde.title)
    expect(page).to have_content(@legally_blonde.creation_year)
    expect(page).to have_content(@legally_blonde.genre)
    expect(page).to have_content(@the_grinch.title)
    expect(page).to have_content(@the_grinch.creation_year)
    expect(page).to have_content(@the_grinch.genre)
  end
end