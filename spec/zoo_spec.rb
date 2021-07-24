require './lib/zoo'
require './lib/animal'

RSpec.describe Zoo do
  it 'exists' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo).to be_a(Zoo)
  end

  it 'has attributes' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.street).to eq("2300 Southern Blvd")
    expect(zoo.city).to eq("Bronx")
    expect(zoo.state).to eq("NY")
    expect(zoo.zip_code).to eq("10460")
    expect(zoo.inventory).to eq([])
  end

  it 'has an address' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
  end

  it 'has no animals by default' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")

    expect(zoo.animal_count).to eq(0)
  end

  it 'can add animals' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)

    expect(zoo.inventory).to eq([animal_1, animal_2])
    expect(zoo.animal_count).to eq(2)
  end

  it 'can find animals older than certain age' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)
    zoo.add_animal(animal_3)
    zoo.add_animal(animal_4)

    expect(zoo.animals_older_than(250)).to eq([])
    expect(zoo.animals_older_than(100)).to eq([animal_3, animal_4])
  end

  it 'gives the total weight of animals' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)
    zoo.add_animal(animal_3)
    zoo.add_animal(animal_4)

    expect(zoo.total_weight_of_animals).to eq(265)
  end

  it 'can give zoo details' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)
    zoo.add_animal(animal_3)
    zoo.add_animal(animal_4)

    expected = {"total_weight" => 265, "street_address" => "2300 Southern Blvd"}
    expect(zoo.details).to eq(expected)
  end

  it 'can be sorted by weight' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)
    zoo.add_animal(animal_3)
    zoo.add_animal(animal_4)

    expect(zoo.animals_sorted_by_weight).to eq([animal_4, animal_3, animal_1, animal_2])
  end

  it 'can return a hash of animals by 1st letter' do
    zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)
    animal_5 = Animal.new("Dog", 65, 200)

    zoo.add_animal(animal_1)
    zoo.add_animal(animal_2)
    zoo.add_animal(animal_3)
    zoo.add_animal(animal_4)
    zoo.add_animal(animal_5)

    expected = {
                 "C" => [animal_3],
                 "D" => [animal_4, animal_5],
                 "R" => [animal_2],
                 "S" => [animal_1]
               }
    expect(zoo.animal_hash).to eq(expected)
  end
end
