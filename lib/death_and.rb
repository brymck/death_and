require 'yaml'
require 'ansi/code'
require 'death_and/version'
require 'death_and/format'
require 'death_and/data'
require 'death_and/state'

module DeathAnd
  class Application
    class << self
      def run
        @@states ||= []
        Data.load
        Data['states'].each do |state|
          @@states << State.new(state)
        end
        @@current = @@states.first unless @@states.empty?
        prompt
      end

      def prompt
        while true
          print "Type a state (currently #{@@current.abbreviation}), gross income figure, or 'exit': "
          response = gets.chomp
          case response
          when /^[0-9]+$/
            puts Format.currency @@current.income_tax response.to_i
          when /^[a-zA-Z]{2}$/
            @@current = @@states.find { |state| state.abbreviation == response } || @@current || nil
          when 'exit', 'x'
            exit
          end
        end
      end
    end
  end
end

DeathAnd::Application.run
