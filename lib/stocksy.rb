# frozen_string_literal: true

module Stocksy
  class Error < StandardError; end
end

require "active_support"
require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup
loader.eager_load
