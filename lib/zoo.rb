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
  
end
