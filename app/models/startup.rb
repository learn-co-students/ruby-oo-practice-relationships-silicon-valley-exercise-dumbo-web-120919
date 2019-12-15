class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize (name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot (new_domain, new_name)
        @name = new_name
        @domain = new_domain

    end

    def sign_contract (venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funding_rounds.sum{|funding_round| funding_round.investment}
    end

    def investors
        funding_rounds.map{|funding_round| funding_round.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end


    def self.all
        @@all
    end

end
