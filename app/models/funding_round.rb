class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment   

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist 
        @type = type
        # Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
        @investment = investment
        # This should be a float that is not a negative number.

        @@all << self
    end

    def self.all 
        @@all 
    end

end

