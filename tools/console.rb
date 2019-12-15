require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

  booga = Startup.new("Booga", "Billy Booga", "www.booga.com")

  chili = VentureCapitalist.new("Chili")
  chili.total_worth = 1000

  bread = VentureCapitalist.new("Bread")
  bread.total_worth = 1_000_000

  booga.sign_contract(chili, "Angel", 100.0)
  booga.sign_contract(bread, "Angel", 1000.0)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line