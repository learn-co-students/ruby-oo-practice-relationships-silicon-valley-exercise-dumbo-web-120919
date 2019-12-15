class VentureCapitalist

    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize (name)
        @name = name
        @total_worth = 0

        @@all << self
    end

    def offer_contract (startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end


    def funding_rounds
        FundingRound.all.select{|funding_round| funding_round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max{|funding_round| funding_round.investment}
    end

    def find_by_domain (domain)
        funding_rounds.find{|funding_round| funding_round.startup.domain == domain}.startup
    end

    def funding_rounds_by_startup (startup)
        funding_rounds.select {|funding_round| funding_round.startup == startup}
    end

    def invested (domain)
        invested_startup = find_by_domain(domain)
        funding_rounds_by_startup(invested_startup).sum {|funding_round| funding_round.investment}
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select {|venture_cap| venture_cap.total_worth >= 1_000_000_000}
    end


end
