require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe "Class Methods" do
    describe "self.sort_a" do
      it "should return missions alphabetically" do
        Mission.create(title: "z", time_in_space: 2)
        Mission.create(title: "g", time_in_space: 2)
        Mission.create(title: "b", time_in_space: 2)
        Mission.create(title: "f", time_in_space: 2)

        expect("b").to eq(Mission.sort_a.first.title)

        Mission.create(title: "a", time_in_space: 2)
        
        expect("a").to eq(Mission.sort_a.first.title)
      end
    end
  end
end
