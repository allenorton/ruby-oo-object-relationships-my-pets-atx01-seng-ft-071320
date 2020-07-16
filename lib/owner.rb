require 'pry'
class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self 
  end
  #class methods
  def self.all
    @@all
  end
  def self.count
    self.all.count
  end 
  def self.reset_all
    self.all.clear
  end
  #instance methods
  def say_species
    p "I am a #{@species}."
  end
  def cats
    Cat.all.select { |cat| cat.owner == self} 
  end 
  #binding.pry
  def dogs
    Dog.all.select { |dog| dog.owner == self}
  end
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end 
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
  def walk_dogs
    self.dogs.each do |dogs|
      dogs.mood = "happy"
    end 
  end
  def feed_cats
    self.cats.each do |cats|
      cats.mood = "happy"
    end
  end
  def sell_pets
    self.cats.each do |cats|
      cats.mood = "nervous"
      cats.owner = nil
    end
    self.dogs.each do |dogs|
      dogs.mood = "nervous"
      dogs.owner = nil 
    end 
  end
  def list_pets
    p "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
  


end