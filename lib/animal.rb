class Animal
  attr_reader :kind
  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight
    @age = age
  end

  def weight
    string_weight = @weight.to_s
    full_weight_in_string = string_weight + " pounds"
  end

  def age
    string_age = @age.to_s
    full_age = string_age + " weeks"
  end

  def age_in_days
    @age * 7
  end

  def feed!(pounds)
    @weight += pounds
  end
end
