class Zoo
  attr_reader  :name, :street, :city, :state, :zip_code, :address
  def initialize(animals)
    @animals = []
  end

  def inventory
    @animals
  end

  def animal_count
    @animals.length
  end

  def add_animal(animal)
    @animal.push(animal)
  end

  def animals_older_than
    @animals.map do |age|
      age >= 10
    end
  end
end
