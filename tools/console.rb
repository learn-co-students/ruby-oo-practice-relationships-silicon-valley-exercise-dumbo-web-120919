require_relative '../config/environment.rb'
#startup -< funding rounds >-venture capitalists

#1. startup, get all the funding rounds that belong to this startup
#2. From those funding rounds, figure out which venture capitalists they belong to

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
s1 = Startup.new("Fish Face", "Ted", "fishface.com")
s2 = Startup.new("Lobster Claw", "Bob", "lobsterclaw.com")
s3 = Startup.new("Clam Shell", "Mary", "clamshell.com")

v1 = VentureCapitalist.new("Dan", 1_000_000_001)
v2 = VentureCapitalist.new("Lily", 2_000_000_001)
v3 = VentureCapitalist.new("Claire", 5_000_001)
v4 = VentureCapitalist.new("Simon", 10_000_001)

# Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
f1 = FundingRound.new(s1, v1, "Angel", 5000.00)
f2 = FundingRound.new(s1, v4, "Seed", 300000.00)
f3 = FundingRound.new(s2, v3, "Angel", 15000.00)
f4 = FundingRound.new(s3, v2, "Seed", 200000.00)
f5 = FundingRound.new(s3, v3, "Series A", 50000.00)
f6 = FundingRound.new(s1, v4, "Series B", 500000.00)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line