require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# Startup.new(startup_name, founder_name, startup_domain)
s1 = Startup.new("facebook", "MZ", "fb.com")
s2 = Startup.new("google", "RR", "google.com")

# VentureCapitalist.new(name, total_worth)
v1 = VentureCapitalist.new("vulture v", 9999)
v2 = VentureCapitalist.new("winner w", 1_000_000_999)
v3 = VentureCapitalist.new("beginner", 555)
v4 = VentureCapitalist.new("beyond d", 9_999_000_999)
v5 = VentureCapitalist.new("VC No.5", 9_999_000_999)

# FundingRound.new(startup, venture_capitalist, type, invest_amount)
fr1 = FundingRound.new(s1, v1, "Series C", 950_000.75)
fr2 = FundingRound.new(s2, v2, "Series A", 3_000.00)
fr3 = FundingRound.new(s1, v4, "Series B", 777.77)
# fr4 = FundingRound.new(s1, v5, "Series B", 777.77)
fr5 = FundingRound.new(s2, v4, "Angel", 33.33)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line