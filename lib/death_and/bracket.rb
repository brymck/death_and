module DeathAnd
  class Bracket
    def initialize(rate, lower, upper = nil)
      @rate = rate
      @lower = lower
      @upper = upper
    end

    attr_reader :rate, :lower, :upper

    def tax(income)
      income = [income, @upper].min unless @upper.nil?
      ([income - @lower, 0].max * @rate * 100).ceil / 100.0
    end
  end
end
