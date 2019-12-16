require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 =  Startup.new("Uber", "Tom", "cars")
s2 =  Startup.new("Fresh Direct", "Kelly", "food")
c1 = VentureCapitalist.new("Also Tom", 1_000_000_001)
c2 = VentureCapitalist.new("Also Kelly", 1_000_000)
f1 = FundingRound.new(s1, c1, "phase 1", 500)
f2 = FundingRound.new(s1, c1, "phase 2", 500)
f3 = FundingRound.new(s1, c1, "phase 3", 500)
binding.pry
0 #leave this here to ensure binding.pry isn't the last line