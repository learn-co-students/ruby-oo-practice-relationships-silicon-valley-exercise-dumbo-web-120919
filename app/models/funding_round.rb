class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :invest_amount

    @@all = []

    def initialize(startup, venture_capitalist, type, invest_amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @invest_amount = invest_amount
        @@all << self
    end

    def startup
        @startup
    end

    def venture_capitalist
        @venture_capitalist
    end

    def type
        @type
    end

    def investment
        @invest_amount
    end

    def self.all
        @@all
    end

end


