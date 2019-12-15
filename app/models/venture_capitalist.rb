class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup_object, type, invest_amount)
        FundingRound.new(startup_object, self, type, invest_amount)
    end

    def funding_rounds
        FundingRound.all.select do |round_object|
            round_object.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map{|round_for_this_vc| round_for_this_vc.startup}.uniq.compact
    end

    def biggest_investment
        largest_fund = 0
        funding_rounds.each do |round_object|
            if round_object.invest_amount > largest_fund
                largest_fund = round_object.invest_amount
            end
        end

        funding_rounds.select do |round_object|
            round_object.invest_amount == largest_fund
        end
    end

    def invested(domain)
        # returns the total amount invested in that domain
        amount = 0
        FundingRound.all.each do |round_object|
            if round_object.startup.startup_domain == domain
                amount += round_object.invest_amount
            end
        end
        amount
    end

    def self.tres_commas_club
        @@all.select do |vc_instance|
            vc_instance.total_worth > 1_000_000_000
        end
    end

    def self.all
        @@all
    end

end
