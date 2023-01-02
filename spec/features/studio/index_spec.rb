require 'rails_helper'

RSpec.describe "index" do
  before(:each) do
    universal = Studio.create!(name: "Universal Studios", location: "LA")
    limo = Studio.create!(name: "Limo Productions", location: "Glendale")

    mummy = universal.movies.create!(title: "The Mummy", creation_year: "1999", genre: "Action")
    legally_blonde = universal.movies.create!(title: "Legally Blonde", creation_year: "2000", genre: "comedy")
    the_grinch = limo.movies.create!(title: "The Grinch", creation_year: "2001", genre: "Holiday")

    jim = the_grinch.actors.create!(name: "Jim Carrey", age: "30")
    reese = legally_blonde.actors.create!(name: "Reese Witherspoon", age: "32")
    brendan = mummy.actors.create!(name: "Brendan Frazier", age: "33")
    cindy = the_grinch.actors.create!(name: "Cindy Lou-Who", age: "8")
  end
  it 'lists all studios and their name and location' do
    visit '/studios/index'

    expect(page).to have_content("Universal Studios")
    expect(page).to have_content("Limo Productions")
    expect(page).to have_content("LA")
    expect(page).to have_content("Glendale")
  end

  it 'lists all the studios movies and the movies attributes' do
    visit '/studios/index'

    expect(page).to have_content("The Mummy")
    expect(page).to have_content("1999")
    expect(page).to have_content("Action")
    expect(page).to have_content("Legally Blonde")
    expect(page).to have_content("2000")
    expect(page).to have_content("comedy")
    expect(page).to have_content("The Grinch")
    expect(page).to have_content("2001")
    expect(page).to have_content("Holiday")
  end
end