class Zoo
  attr_reader :name,
              :street,
              :city,
              :state,
              :zip_code,
              :inventory,
              :animal_count

  def initialize(name, street, city, state, zip_code)
    @name     = name
    @street   = street
    @city     = city
    @state    = state
    @zip_code = zip_code
    @inventory = []
    @animal_count = 0
  end

  def address
    "#{@street} #{@city}, #{@state} #{@zip_code}"
  end

  def add_animal(animal)
    @inventory.push(animal)
    @animal_count += 1
  end

  def animals_older_than(age)
    older_animals = []
    @inventory.each do |animal|
      if animal.age_in_days / 7 >= age
        older_animals.push(animal)
      end
    end
    older_animals
  end

  def total_weight_of_animals
    total_weight = 0
    @inventory.each do |animal|
      total_weight += animal.weight.to_i
    end
    total_weight
  end

  def details
    {
      "total_weight" => total_weight_of_animals,
      "street_address" => street
    }
  end

  def animals_sorted_by_weight
    @inventory.sort_by do |animal|
      animal.weight.to_i
    end.reverse
  end

  def animal_hash
    grouped_animal = Hash.new
    @inventory.each do |animal|
      first_letter = animal.kind[0]
      if grouped_animal[first_letter]
        grouped_animal[first_letter] << animal
      else
        grouped_animal[first_letter] = [animal]
      end
    end
    grouped_animal
  end
end
