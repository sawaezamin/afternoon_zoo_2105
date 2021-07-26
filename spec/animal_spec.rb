require './lib/animal'

RSpec.describe Animal do
  it 'exists' do
    animal = Animal.new("Sea Otter", 10, 25)

    expect(animal).to be_a(Animal)
  end

  it 'has attributes' do
    animal_1 = Animal.new("Sea Otter", 10, 25)

    expect(animal_1.kind).to eq("Sea Otter")
    expect(animal_1.weight).to eq("10 pounds")
    expect(animal_1.age).to eq("25 weeks")
  end

  it 'has age in days' do
    animal_1 = Animal.new("Sea Otter", 10, 25)

    expect(animal_1.age_in_days).to eq(175)
  end

  it 'can feed and add weight to animals' do
    animal_1 = Animal.new("Sea Otter", 10, 25)

    animal_1.feed!(2)
    expect(animal_1.weight).to eq("12 pounds")

    animal_1.feed!(1)
    expect(animal_1.weight).to eq("13 pounds")
  end
end
