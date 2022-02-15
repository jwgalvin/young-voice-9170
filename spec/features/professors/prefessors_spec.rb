require 'rails_helper'

describe 'application' do
  before(:each) do
    @franks = Professor.create!(
              name: "Franklin Farsight",
              age: 46, speciality: "Voodoo" )
    @petes = Professor.create!(
              name: "Pete Patinkin",
               age: 92, speciality: "Zombies")
    @ned = Professor.create!(
              name: "Ned Needly",
              age: 24, speciality: "Psychic")
  it 'visits the professors index and displays in  Alpha' do
    visit "/professors"

    expect(page).to have_content(@franks.name)
    expect(page).to have_content(@petes.speciality)
    expect(page).to have_content(@ned.age)
    expect(@franks.name).to appear_before(@ned.name)
    expect(@ned.name).to appear_before(@petes.name)
  end
end
