class Animal
  attr_reader :kind, :weight, :age
  def initialize(kind, weight, age)
    @kind   = kind
    @weight = weight
    @age    = age
  end

  def age_in_days
    @age * 7
  end

  def feed(num)
    @weight = @weight + num
    return "#{@weight} pounds"
  end
end
