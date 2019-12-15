class Startup
    attr_accessor :startup_name, :startup_domain
    attr_reader :founder_name

    @@all = []

    def initialize(startup_name, founder_name, startup_domain)
        @startup_name = startup_name
        @founder_name = founder_name
        @startup_domain = startup_domain
        @@all << self
    end

    def domain
        @startup_domain
    end

    def pivot(domain, name)
        @startup_domain = domain
        @startup_name = name
    end

    # Startup.find_by_founder
    # given a string of a founder's name, returns the first startup whose founder's name matches
    def find_by_founder(founder)
        @@all.find do |startup_instance|
            startup_instance.founder_name == founder
        end
    end

    # Startup.domains
    # should return an array of all of the different startup domains
    def domains
        @@all.map do |startup_instance|
            startup_instance.startup_domain
        end
    end

    def sign_contract(vc_object, investment_type, investment_amount)
        FundingRound.new(self, vc_object, investment_type, investment_amount)
    end

    def num_funding_rounds
        num = 0
        FundingRound.all.each do |round_object|
            if round_object.startup == self
                num += 1
            end
        end
        num
    end

    def total_funds
        sum = 0
        FundingRound.all.each do |round_object|
            if round_object.startup == self
                sum += round_object.invest_amount
            end
        end
        sum
    end

    def investors
        result = FundingRound.all.map{|round_object|round_object.venture_capitalist if round_object.startup == self}.uniq.compact
    end

    def big_investors
        # 1st loop: loop thru the array of rich VCs (VCs that are worth > 1 bil)
        # 2nd loop: loop thru those invested in this startup (by calling #investors method)
        # check if any of rich VCs is the same VCs that invested in this startup
        # if so, push that object to an empty array
        result = []
        VentureCapitalist.tres_commas_club.map do |rich_vc_object|
            investors.map do |vc_object|
                if rich_vc_object == vc_object
                    result << rich_vc_object
                end
            end
        end
        result
    end

    def self.all
        @@all
    end

end