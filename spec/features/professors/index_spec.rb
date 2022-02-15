require 'rails_helper'

describe 'application' do
  before(:each) do
    @franks = Professor.create!(
              name: "Franklin Farsight",
              age: 46, specialty: "Voodoo" )
    @petes = Professor.create!(
              name: "Pete Patinkin",
               age: 92, specialty: "Zombies")
    @ned = Professor.create!(
              name: "Ned Needly",
              age: 24, specialty: "Psychic")
  end

  it 'visits the professors index and displays in  Alpha' do
    visit "/professors"

    expect(page).to have_content(@franks.name)
    expect(page).to have_content(@petes.specialty)
    expect(page).to have_content(@ned.age)
    expect(@franks.name).to appear_before(@ned.name)
    expect(@ned.name).to appear_before(@petes.name)
  end
end
describe "User story 2" do
  before(:each)   do
    @snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    @hagarid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
    @lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

    @harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    @malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
    @longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

    ProfessorStudent.create(student_id: @harry.id, professor_id: @snape.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @harry.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @hagarid.id)
    ProfessorStudent.create(student_id: @malfoy.id, professor_id: @lupin.id)
    ProfessorStudent.create(student_id: @longbottom.id, professor_id: @snape.id)
  end
  it "lists the professors students on the professors show page" do
    visit "/professors/#{@snape.id}"
    # save_and_open_page
    expect(page).to have_content(@harry.name)
    expect(page).to have_content(@longbottom.name)
  end
end
