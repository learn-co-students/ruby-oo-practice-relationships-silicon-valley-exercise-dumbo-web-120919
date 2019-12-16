class Startup
    attr_accessor :name, :domain
    attr_reader :founder 

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

    def pivot(domain, name)
        self.domain = domain
        self.name = name 
    end

    def self.find_by_founder(name)
    # given a string of a founder's name, returns the first startup whose founder's name matches 
        self.all.find do |startup_instance|
            startup_instance.founder == name
        end
    end

    def self.domains 
    # should return an array of all of the different startup domains
        self.all.map do |startup_instance|
            startup_instance.domain 
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def startup_rounds
        startup_rounds = FundingRound.all.select do |funding_instance|
            funding_instance.startup == self
        end
    end

    def num_funding_rounds
        startup_rounds.count 
    end

    def total_funds
        total_sum = 0

        startup_rounds.each do |round|
            total_sum += round.investment 
        end
        total_sum
    end

    def investors 
        investors_array = startup_rounds.map do |round|
            round.venture_capitalist
        end
        investors_array.uniq
    end

    def big_investors
        #look through funding rounds to get list of investors for this startup
        #of those investors check if any are in tres commas club
       big_vc = []
       VentureCapitalist.tres_commas_club.map do |vc|
            investors.map do |investor|
                if vc == investor
                    big_vc << vc 
                end
            end
       end
       big_vc
    end

end



