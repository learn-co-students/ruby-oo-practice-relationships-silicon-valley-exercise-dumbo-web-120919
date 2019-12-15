class Startup

    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

        # INITIALIZATION #

    def initialize(name, founder, domain)   # WORKS #
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

        # INSTANCE METHODS #

    def sign_contract(venture_capitalist, type, amt_invested)   # WORKS #
        FundingRound.new(self, venture_capitalist, type, amt_invested)
    end

    def funding_rounds  # WORKS #
        FundingRound.all.select { |round| round.startup == self }
    end

    def num_funding_rounds # WORKS #
        rounds = funding_rounds
        rounds.count
    end

    def total_funds # WORKS #
        investments = funding_rounds.collect { |round| round.amt_invested }
        investments.inject { |sum, n| sum += n }
    end

    def investors   # WORKS #
        investors = funding_rounds.collect { |round| round.venture_capitalist }
        investors.uniq
    end

    def big_investors   # WORKS #
        investors.select { |investor| investor.total_worth > 1_000_000_000 }
    end

    def pivot(name, domain) # WORKS #
        @name = name
        @domain = domain
        return self
    end

        # CLASS METHODS #

    def self.all    # WORKS #
        @@all
    end

    def self.find_by_founder(founder)   # WORKS #
        @@all.find { |startup| startup.founder == founder }
    end

        # END #

end
