# frozen_string_literal: true

require 'cspec'
require_relative "game_output"
require_relative "game_validator"
require_relative "adjudicator"
require_relative "turn_master"
require_relative "adjudicator"
require_relative "game_input"

result = CSpec::Runner.run!("#{Dir.pwd}/specs.csv")
exit result ? 0 : 1