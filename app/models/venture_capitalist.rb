class VentureCapitalist
    attr_accessor :total_worth
    attr_reader :name 

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        

        @@all << self
    end

    def self.all 
        @@all 
    end

    def self.tres_commas_club
    # returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
        self.all.select do |vc|
            vc.total_worth >= 1_000_000_000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |funding_instance|
            funding_instance.venture_capitalist == self
        end
    end

    def portfolio
        startup_array = funding_rounds.map do |round|
            round.startup 
        end
        startup_array.uniq
    end

    def biggest_investment
        sorted_rounds = funding_rounds.max_by do |round|
            round.investment
        end
        sorted_rounds
    end

    def invested(domain)
        # given a domain string, returns the total amount invested in that domain
        total_invested = 0

        funding_rounds.each do |round|
            if round.startup.domain == domain 
                total_invested += round.investment
            end
        end
        total_invested
    end

end


