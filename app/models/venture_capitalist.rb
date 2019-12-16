class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end
    def self.all
        @@all
    end
    #returns array of all capatalists in the tres commas club
    def self.tres_commas_club
        VentureCapitalist.all.select{|capitalist| capitalist.total_worth > 1_000_000_000}
    end
    #creates new funding round instance
    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end
    #returns all funding rounds for venture capitalist\
    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end
    #returns all startups that have been funded by this investor
    def portfolio
        FundingRound.all.map do |funding_round| 
            if funding_round.venture_capitalist == self
                funding_round
            end
        end
    end
    #returns biggest investment
    def biggest_investment
        FundingRound.all.max_by{|funding_round| funding_round.investment}
    end
    #returns sum of all investments in particular domain
    def invested(domain)
        FundingRound.all.inject(0) do |sum, funding_round|
            if (funding_round.venture_capitalist == self && funding_round.startup.domain == domain)
                sum += funding_round.investment
            else
                sum
            end
        end
    end
end

#offer_contract
# given a startup object, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
# VentureCapitalist#funding_rounds
# returns an array of all funding rounds for that venture capitalist
# VentureCapitalist#portfolio
# Returns a unique list of all startups this venture capitalist has funded
# VentureCapitalist#biggest_investment
# returns the largest funding round given by this venture capitalist
# VentureCapitalist#invested
# given a domain string, returns the total amount invested in that domain