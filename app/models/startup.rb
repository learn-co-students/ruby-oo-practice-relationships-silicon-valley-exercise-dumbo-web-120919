class Startup
    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
    def self.all
        @@all
    end
    #change domain and name of startup
    def pivot(new_name, new_domain)
        @name = new_name
        @domain = new_domain
    end
    #return first startup that has name of founder
    def self.find_by_founder(founder_name)
        Startup.all.find{|startup| founder_name}
    end
    #returns array of all startup domains
    def self.domains
        Startup.all.map{|startup| startup.domain}
    end
    #create new funding round
    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end
    #returns number of funding rounds the startup has gotten
    def num_funding_rounds
        FundingRound.all.select{|funding_round| funding_round.startup == self}.length
    end
    #returns sum of investments
    def total_funds
        FundingRound.all.sum{|funding_round| funding_round.startup == self ? funding_round.investment : 0}
    end
    #returns all investors of startup
    def investors
        FundingRound.all.map do |funding_round| 
            if funding_round.startup == self
               funding_round.venture_capitalist
            end
        end.uniq
    end
    #returns array of all investors in tres commas club
    def big_investors
        VentureCapitalist.tres_commas_club && self.investors
    end
end