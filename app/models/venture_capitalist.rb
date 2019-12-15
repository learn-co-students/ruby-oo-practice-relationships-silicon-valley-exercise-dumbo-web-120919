class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    # INITIALIZATION #

    def initialize(name, total_worth)   # WORKS #
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    # INSTANCE METHODS #

    def offer_contract(startup, type, amt_invested) # WORKS #
        FundingRound.new(startup, self, type, amt_invested)
    end

    def funding_rounds  # WORKS #
        FundingRound.all.select { |round| round.venture_capitalist == self }
    end

    def portfolio   # WORKS #
        startups = funding_rounds.collect { |round| round.startup }
        startups.uniq
    end

    def biggest_investment  # WORKS #
        investments = funding_rounds.collect { |round| round.amt_invested }
        investments.sort
        funding_rounds.find { |round| round.amt_invested == investments[-1] }
    end

    def invested(sought_domain) # WORKS #
        rounds_in_domain = funding_rounds.select { |round| round.startup.domain == sought_domain }
        investments = rounds_in_domain.collect { |round| round.amt_invested }
        investments.inject { |sum, n| sum += n }
    end

    # CLASS METHODS #

    def self.all    # WORKS #
        @@all
    end

    def self.tres_commas_club   # WORKS #
        @@all.select { |investor| investor.total_worth > 1_000_000_000 }
    end

    # END #

end
