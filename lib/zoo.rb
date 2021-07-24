class Zoo
  attr_reader :street,
              :city,
              :state,
              :zip_code,
              :inventory
  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end


  def address
    "#{street} #{city}, #{state} #{zip_code}"
  end


  def animal_count
    @inventory.length
  end


  def add_animal(animal)
    @inventory.push(animal)
  end


  def animals_older_than(age)
    older_age = []
    @inventory.each do |animal|
      if animal.age_in_days / 7 >= age
        older_age << animal
      end
    end
    older_age
  end


  def total_weight_of_animals
    total_weight = 0
    @inventory.each do |animal|
      total_weight += animal.weight.split(" ").first.to_i
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
      animal.weight.split.first.to_i
    end.reverse
  end


  def animal_hash
    new_hash = Hash.new
    @inventory.each do |animal|
      first_letter = animal.kind[0]
      if new_hash[first_letter]
        new_hash[first_letter] << animal
      else
        new_hash[first_letter] = [animal]
      end
    end
    new_hash
  end
end
