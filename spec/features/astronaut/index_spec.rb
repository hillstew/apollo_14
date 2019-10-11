require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do 
  describe "when I visit '/astronauts'" do
    it 'I see a list of astronauts' do
      a_1 = Astronaut.create(name: "hill", age: 29, job: "the best one")
      a_2 = Astronaut.create(name: "graham", age: 27, job: "the second best one")

      visit '/astronauts'

      expect(page).to have_content(a_1.name)
      expect(page).to have_content(a_1.age)
      expect(page).to have_content(a_1.job)

      expect(page).to have_content(a_2.name)
      expect(page).to have_content(a_2.age)
      expect(page).to have_content(a_2.job)
    end

    it "I see the average age of all astronauts" do
      a_1 = Astronaut.create(name: "hill", age: 30, job: "the best one")
      a_2 = Astronaut.create(name: "graham", age: 20, job: "the second best one")

      visit '/astronauts'

      expect(page).to have_content("Average Age: 25") 
    end

    it "I see a list of the space missions' in alphabetical order for each astronaut." do
      a_1 = Astronaut.create(name: "hill", age: 30, job: "the best one")
      a_2 = Astronaut.create(name: "graham", age: 20, job: "the second best one")
      a_1.missions.create(title: "lets go", time_in_space: 2)
      a_1.missions.create(title: "yesssss", time_in_space: 3)
      a_1.missions.create(title: "nahhh", time_in_space: 5)
  
      visit '/astronauts'
      
      expect(page).to have_content("lets go")
      expect(page).to have_content("nahhh")
      expect(page).to have_content("yesssss")
    end
  end
end