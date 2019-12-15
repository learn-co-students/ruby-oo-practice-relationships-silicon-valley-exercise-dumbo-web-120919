require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

bookface = Startup.new("Bookface", "Zark Muckerberg", "Social Media")
mein_space = Startup.new("Mein Space", "Thom", "Social Media")
duber = Startup.new("Duber", "Johnny Duber", "Travel")
seamfull = Startup.new("Seamfull", "Hungry Bob", "Delivery")
picture_pal = Startup.new("Picture Pal", "Kat Blackwood", "Social Media")
car_go_fast = Startup.new("Car-Go-Fast", "Elmer 'speedy' Jones", "Travel")

bobby = VentureCapitalist.new("Bobby Billions", 2_000_000_000)
denion = VentureCapitalist.new("John Denion", 30_000_000)
alfi = VentureCapitalist.new("Alfi Rolon", 50_000_000)
sam = VentureCapitalist.new("Sam Grubb", 45_000_000)
mike = VentureCapitalist.new("Mike Ruocco", 33_000_000)
kat = VentureCapitalist.new("Kat Blackwood", 50_000_000_000)

fr1 = FundingRound.new(bookface, kat, "Angel", 1_000_000.0)
fr2 = FundingRound.new(bookface, mike, "Angel", 3_000_000.0)
fr3 = FundingRound.new(picture_pal, alfi, "Seed", 10_000_000.0)
fr4 = FundingRound.new(car_go_fast, sam, "Pre-Seed", 12_000_000.0)
fr5 = FundingRound.new(seamfull, bobby, "Seed", 200_000_000.0)
fr6 = FundingRound.new(duber, denion, "Series A", 500_000.0)
fr7 = FundingRound.new(mein_space, denion, "Series A", 500_000.0)
fr8 = FundingRound.new(picture_pal, denion, "Series B", 800_000.0)
fr9 = FundingRound.new(bookface, sam, "Series C", 700_000.0)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line