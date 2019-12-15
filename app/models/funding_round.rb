class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :amt_invested

    @@all = []

    # INITIALIZATION #

    def initialize(startup, venture_capitalist, type, amt_invested) # WORKS #
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @amt_invested = amt_invested
        @type = type

        @@all << self
    end

    # INSTANCE METHODS #

    # CLASS METHODS #

    def self.all    # WORKS #
        @@all
    end

    # END #

end
