require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#Cults
cannibals = Cult.new("Cannibals", "Miami, FL", 1906, "We eat people!")
energy_vampires = Cult.new("Energy Vampires", "Everywhere", 2010, "We rant endlessdly. Other people listen and slowly fade away.")
scientologists = Cult.new("Scientology Religion", "Miami, FL", 2010, "Aliens are better than us. Give us your money.")

#Followers
hannibal = Follower.new("Hannibal", 52, "I eat people.")
colin = Follower.new("Colin Robinson", 20, "You won't make it out of this awake.")
dwight = Follower.new("Dwight Schrute", 40, "You don't know anything about me.")

#BloodOaths
dwight_cannibal = cannibals.recruit_follower(dwight)
hannibal_cannibal = cannibals.recruit_follower(hannibal)
colin_vampire = energy_vampires.recruit_follower(colin)

#Method testting
cannibals.cult_population
Cult.find_by_name("Hannibal")
Cult.find_by_location("Miami, FL")
Cult.find_by_founding_year(2010)
hannibal.cults
hannibal.join_cult(scientologists)
dwight.join_cult(energy_vampires)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
