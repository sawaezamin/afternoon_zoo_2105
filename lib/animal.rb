class Animal
  attr_reader :kind

  def initialize(kind, weight, age)
    @kind   = kind
    @weight = weight
    @age    = age
  end

  def weight
    "#{@weight} pounds"
  end

  def age
    "#{@age} weeks"
  end

  def age_in_days
    @age * 7
  end

  def feed!(pound)
    @weight += pound
  end
end
