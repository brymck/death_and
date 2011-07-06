require 'death_and/bracket'

module DeathAnd
  class State
    def initialize(params = {})
      @name = params['name']
      @abbreviation = params['abbreviation']
      build_brackets params['brackets']
    end

    attr_reader :name, :abbreviation

    def [](index)
      @brackets[index]
    end

    def []=(index, bracket)
      @brackets[index] = bracket
    end

    def <<(bracket)
      @brackets << bracket
    end

    def income_tax(income)
      tax = 0
      @brackets.each do |bracket|
        tax += bracket.tax(income)
      end
      tax
    end

    private

    def build_brackets(brackets)
      @brackets = []
      unless brackets.nil?
        lower = 0
        brackets.each do |bracket|
          @brackets << Bracket.new(bracket['rate'], lower, bracket['upper'])
          lower = bracket['upper']
       end
      end
    end
  end
end
