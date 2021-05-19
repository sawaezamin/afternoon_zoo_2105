require './lib/animal'
require '.lib/zoo'

RSpec.describe Zoo do
  descrive '#initialize' do
    it 'is an instance of zoo' do
      zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY")
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)

      expect(zoo).to be_an_instance_of(Zoo)
    end

    it 'has many attributes' do
      zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY")
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)

      expect(zoo.street).to eq("2300 Southern Blvd")
      expect(zoo.city).to eq("Bronx")
      expect(zoo.state).to eq("NY")
      expect(zoo.zip_code).to eq("10460")
      expect(zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
    end

    it 'empty array of zoo inventory' do
      zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY")
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)

      expect(zoo.inventory).to eq([])
      expect(zoo.animal_count). to eq(0)
    end

    it 'can add animals inside' do
      zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY")
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)

      zoo.add_animal(animal_1)
      zoo.add_animal(animal_2)

      expect(zoo.inventory).to eq([animal_1, animal_2])
      expect(zoo.animal_count).to eq(2)
    end
  end
end
